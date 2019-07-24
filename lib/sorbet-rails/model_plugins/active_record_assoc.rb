require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordAssoc < SorbetRails::ModelPlugins::Base
  def initialize(model_class, available_classes)
    super
    @columns_hash = @model_class.table_exists? ? @model_class.columns_hash : {}
  end

  def generate(root)
    return unless @model_class.reflections.length > 0

    assoc_module_name = self.model_module_name("GeneratedAssociationMethods")
    assoc_module_rbi = root.create_module(name: assoc_module_name)
    assoc_module_rbi.create_extend(name: "T::Sig")

    model_class_rbi = root.create_class(name: self.model_class_name)
    model_class_rbi.create_include(name: assoc_module_name)

    @model_class.reflections.sort.each do |assoc_name, reflection|
      reflection.collection? ?
        populate_collection_assoc_getter_setter(assoc_module_rbi, assoc_name, reflection) :
        populate_single_assoc_getter_setter(assoc_module_rbi, assoc_name, reflection)
    end
  end

  def populate_single_assoc_getter_setter(assoc_module_rbi, assoc_name, reflection)
    # TODO allow people to specify the possible values of polymorphic associations
    assoc_class = assoc_should_be_untyped?(reflection) ? "T.untyped" : "::#{reflection.klass.name}"
    assoc_type = "T.nilable(#{assoc_class})"
    if reflection.belongs_to?
      # if this is a belongs_to connection, we may be able to detect whether
      # this field is required & use a stronger type
      column_def = @columns_hash[reflection.foreign_key.to_s]
      if column_def
        assoc_type = assoc_class if !column_def.null
      end
    end

    assoc_module_rbi.create_method(
      name: assoc_name.to_s,
      return_type: assoc_type,
    )
    assoc_module_rbi.create_method(
      name: "#{assoc_name}=",
      parameters: [
        Parameter.new(name: "value", type: assoc_type)
      ],
      return_type: nil,
    )
  end

  def populate_collection_assoc_getter_setter(assoc_module_rbi, assoc_name, reflection)
    # TODO allow people to specify the possible values of polymorphic associations
    assoc_class = assoc_should_be_untyped?(reflection) ? "T.untyped" : "::#{reflection.klass.name}"
    relation_class = relation_should_be_untyped?(reflection) ?
      "ActiveRecord::Associations::CollectionProxy" :
      "#{assoc_class}::ActiveRecord_Associations_CollectionProxy"

    assoc_module_rbi.create_method(
      name: assoc_name.to_s,
      return_type: relation_class,
    )
    assoc_module_rbi.create_method(
      name: "#{assoc_name}=",
      parameters: [
        Parameter.new(name: "value", type: "T.any(T::Array[#{assoc_class}], #{relation_class})")
      ],
      return_type: nil,
    )
  end

  def assoc_should_be_untyped?(reflection)
    polymorphic_assoc?(reflection) || !@available_classes.include?(reflection.klass.name)
  end

  def relation_should_be_untyped?(reflection)
    # only type the relation we'll generate
    assoc_should_be_untyped?(reflection) || !@available_classes.include?(reflection.klass.name)
  end

  def polymorphic_assoc?(reflection)
    reflection.through_reflection ?
      polymorphic_assoc?(reflection.source_reflection) :
      reflection.polymorphic?
  end
end