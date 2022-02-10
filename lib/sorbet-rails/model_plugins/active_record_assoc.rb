# typed: true
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordAssoc < SorbetRails::ModelPlugins::Base
  sig { params(model_class: T.class_of(ActiveRecord::Base), available_classes: T::Set[String]).void }
  def initialize(model_class, available_classes)
    super
    @columns_hash = @model_class.table_exists? ? @model_class.columns_hash : {}
  end

  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    return unless @model_class.reflections.length > 0

    assoc_module_name = self.model_module_name("GeneratedAssociationMethods")
    assoc_module_rbi = root.create_module(assoc_module_name)

    model_class_rbi = root.create_class(self.model_class_name)
    model_class_rbi.create_include(assoc_module_name)

    @model_class.reflections.sort.each do |assoc_name, reflection|
      reflection.collection? ?
        populate_collection_assoc_getter_setter(assoc_module_rbi, assoc_name, reflection) :
        populate_single_assoc_getter_setter(assoc_module_rbi, assoc_name, reflection)
    end
  end

  sig do
    params(
      assoc_module_rbi: T.untyped,
      assoc_name: T.untyped,
      reflection: T.untyped
    ).void
  end
  def populate_single_assoc_getter_setter(assoc_module_rbi, assoc_name, reflection)
    # TODO allow people to specify the possible values of polymorphic associations
    assoc_class = assoc_should_be_untyped?(reflection) ? "T.untyped" : "::#{reflection.klass.name}"
    assoc_type = (belongs_to_and_required?(reflection) || has_one_and_required?(reflection) || assoc_class == "T.untyped") ? assoc_class : "T.nilable(#{assoc_class})"

    params = [
      Parameter.new("*args", type: "T.untyped"),
      Parameter.new("&block", type: "T.nilable(T.proc.params(object: #{assoc_class}).void)")
    ]

    assoc_module_rbi.create_method(
      assoc_name.to_s,
      return_type: assoc_type,
    )
    assoc_module_rbi.create_method(
      "build_#{assoc_name}",
      parameters: params,
      return_type: assoc_class,
    )
    assoc_module_rbi.create_method(
      "create_#{assoc_name}",
      parameters: params,
      return_type: assoc_class,
    )
    assoc_module_rbi.create_method(
      "create_#{assoc_name}!",
      parameters: params,
      return_type: assoc_class,
    )
    assoc_module_rbi.create_method(
      "#{assoc_name}=",
      parameters: [
        Parameter.new("value", type: assoc_type)
      ],
      return_type: nil,
    )
    assoc_module_rbi.create_method(
      "reload_#{assoc_name}",
      return_type: assoc_type,
    )
  end

  sig { params(reflection: T.untyped).returns(T::Boolean) }
  private def belongs_to_and_required?(reflection)
    # In Rails 5 and later, belongs_to are required unless specified to be
    # optional (via `optional` or `!required` or `!belongs_to_required_by_default`)
    return false if !reflection.belongs_to?

    column_def = @columns_hash[reflection.foreign_key.to_s]
    db_required_config = column_def.present? && !column_def.null

    rails_required_config =
      if reflection.options.key?(:required)
        !!reflection.options[:required]
      elsif reflection.options.key?(:optional)
        !reflection.options[:optional]
      else
        !!reflection.active_record.belongs_to_required_by_default
      end

    # We check for validations on both the column name (e.g. wizard_id) and
    # association name (e.g. wizard).
    rails_required_config ||= [column_def&.name, reflection.name].compact.any? { |n| attribute_has_unconditional_presence_validation?(n) }

    if rails_required_config && !db_required_config
      puts "Warning: belongs_to association #{reflection.name} is required at the application
        level but **nullable** at the DB level.\n Add a constraint at the DB level
        (using `null: false` and foreign key constraint) to ensure it is enforced.".squish!
    elsif !rails_required_config && db_required_config
      if habtm_class?
        puts "Note: belongs_to association #{reflection.name} is specified as not-null at the
          DB level but will always be **optional** at the application level since it's part of a
          has_and_belongs_to_many association.\n To resolve move to a 'has_many through:' association.".squish!
      else
        puts "Note: belongs_to association #{reflection.name} is specified as not-null at the
          DB level but **optional** at the application level.\n Add a constraint at the app level
          (using `optional: false`) as a validation hint to Rails.".squish!
      end
    end

    rails_required_config || db_required_config
  end

  sig { params(reflection: T.untyped).returns(T::Boolean) }
  private def has_one_and_required?(reflection)
    !!(reflection.has_one? && attribute_has_unconditional_presence_validation?(reflection.name))
  end

  sig do
    params(
      assoc_module_rbi: T.untyped,
      assoc_name: T.untyped,
      reflection: T.untyped
    ).void
  end
  def populate_collection_assoc_getter_setter(assoc_module_rbi, assoc_name, reflection)
    # TODO allow people to specify the possible values of polymorphic associations
    assoc_class = assoc_should_be_untyped?(reflection) ? "T.untyped" : "::#{reflection.klass.name}"
    relation_class = relation_should_be_untyped?(reflection) ?
      "ActiveRecord::Associations::CollectionProxy" :
      "#{assoc_class}::ActiveRecord_Associations_CollectionProxy"

    assoc_module_rbi.create_method(
      assoc_name.to_s,
      return_type: relation_class,
    )
    unless assoc_should_be_untyped?(reflection)
      id_type = "T.untyped"

      if reflection.klass.table_exists?
        # For DB views, the PK column would not exist.
        id_column = reflection.klass.primary_key

        if id_column
          id_column_def = reflection.klass.columns_hash[id_column]

          # Normally the id_type is an Integer, but it could be a String if using
          # UUIDs.
          id_type = type_for_column_def(id_column_def).to_s if id_column_def
        end
      end

      assoc_module_rbi.create_method(
        "#{assoc_name.singularize}_ids",
        return_type: "T::Array[#{id_type}]",
      )
    end
    assoc_module_rbi.create_method(
      "#{assoc_name}=",
      parameters: [
        Parameter.new("value", type: "T::Enumerable[#{assoc_class}]")
      ],
      return_type: nil,
    )
  end

  sig { params(reflection: T.untyped).returns(T.nilable(T::Boolean)) }
  def assoc_should_be_untyped?(reflection)
    # For some polymorphic associations (e.g. a has-many-through where the `source`
    # is polymorphic) we can figure out the type from the class_name or source_type.
    polymorpic_with_unknowable_klass = (
      polymorphic_assoc?(reflection) &&
      !reflection.options.key?(:class_name) &&
      !reflection.options.key?(:source_type)
    )

    polymorpic_with_unknowable_klass || !@available_classes.include?(reflection.klass.name)
  end

  sig { params(reflection: T.untyped).returns(T.nilable(T::Boolean)) }
  def relation_should_be_untyped?(reflection)
    # only type the relation we'll generate
    assoc_should_be_untyped?(reflection) || !@available_classes.include?(reflection.klass.name)
  end

  sig { params(reflection: T.untyped).returns(T.nilable(T::Boolean)) }
  def polymorphic_assoc?(reflection)
    reflection.through_reflection ?
      polymorphic_assoc?(reflection.source_reflection) :
      reflection.polymorphic?
  end
end
