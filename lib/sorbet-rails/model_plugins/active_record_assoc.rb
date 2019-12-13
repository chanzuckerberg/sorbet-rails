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
    assoc_module_rbi.create_extend("T::Sig")

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
    assoc_type = belongs_to_and_required?(reflection) ? assoc_class : "T.nilable(#{assoc_class})"

    assoc_module_rbi.create_method(
      assoc_name.to_s,
      return_type: assoc_type,
    )
    assoc_module_rbi.create_method(
      "#{assoc_name}=",
      parameters: [
        Parameter.new("value", type: assoc_type)
      ],
      return_type: nil,
    )
  end

  sig { params(reflection: T.untyped).returns(T::Boolean) }
  private def belongs_to_and_required?(reflection)
    # In Rails 5 and later, belongs_to are required unless specified to be
    # optional (via `optional` or `!required` or `!belongs_to_required_by_default`)
    return false if !reflection.belongs_to?

    rails_required_config =
      if reflection.options.key?(:required)
        !!reflection.options[:required]
      elsif reflection.options.key?(:optional)
        !reflection.options[:optional]
      else
        !!reflection.active_record.belongs_to_required_by_default
      end

    column_def = @columns_hash[reflection.foreign_key.to_s]
    db_required_config = column_def.present? && !column_def.null

    if rails_required_config && !db_required_config
      puts "Warning: belongs_to association #{reflection.name} is required at the application
        level but **nullable** at the DB level. Add a constraint at the DB level
        (using `null: false` and foreign key constraint) to ensure it is enforced.".squish!
    elsif !rails_required_config && db_required_config
      puts "Warning: belongs_to association #{reflection.name} is specified as not-null at the
        DB level but **not required** at the application level. Add a constraint at the app level
        (using `optional: false`) as a validation hint to Rails.".squish!
    end

    rails_required_config || db_required_config
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
    polymorphic_assoc?(reflection) || !@available_classes.include?(reflection.klass.name)
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
