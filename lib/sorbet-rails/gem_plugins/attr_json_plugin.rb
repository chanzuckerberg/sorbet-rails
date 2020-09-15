# typed: strong
class AttrJsonPlugin < SorbetRails::ModelPlugins::Base
  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    return unless @model_class.include?(::AttrJson::Record)

    custom_module_name = self.model_module_name("GeneratedAttrJsonMethods")
    custom_module_rbi = root.create_module(custom_module_name)

    # here we re-create the model class!
    model_class_rbi = root.create_class(self.model_class_name)
    model_class_rbi.create_extend(custom_module_name)

    # then create custom methods, constants, etc. for this module.
    add_class_methods(custom_module_rbi)

    @model_class.attr_json_registry.definitions.each do |definition|
      add_methods_for_attributes(definition, custom_module_rbi)
    end

    if @model_class.include?(::AttrJson::Record::Dirty)
      custom_module_rbi.create_method('attr_json_changes',
                                      returns: 'AttrJson::Record::Dirty::Implementation')
    end
  end

  private

  def add_class_methods(custom_module_rbi)
    custom_module_rbi.create_method(
      'attr_json_config',
      parameters: [
        ::Parlour::RbiGenerator::Parameter.new(
          'new_values',
          type: 'T.nilable(T::Hash(Symbol, T.untyped))'
        )
      ],
      returns: 'T::Hash(Symbol, T.untyped)',
      class_method: true
    )

    custom_module_rbi.create_method(
      'attr_json',
      parameters: [
        ::Parlour::RbiGenerator::Parameter.new(
          'name',
          type: 'T.any(Symbol, String)'
        ),
        ::Parlour::RbiGenerator::Parameter.new(
          'type',
          type: 'T.any(Symbol, ActiveModel::Type::Value)'
        ),
        ::Parlour::RbiGenerator::Parameter.new(
          '**options',
          type: 'T.untyped'
        )
      ],
      class_method: true
    )
  end

  def add_methods_for_attributes(definition, custom_module_rbi)
    definition_type = get_definition_type(definition)

    custom_module_rbi.create_method(
        "#{definition.name}=",
        parameters: [
          ::Parlour::RbiGenerator::Parameter.new(
            'value',
            type: definition_type
          )
        ],
        returns: definition_type
    )

    custom_module_rbi.create_method(definition.name.to_s,
                                    returns: definition_type)

    custom_module_rbi.create_method("#{definition.name}?",
                                    returns: 'T::Boolean')
  end

  def get_definition_type(definition)

    if definition.array_type?
      "T::Array[#{type_to_class(definition.type.base_type.type.to_s)}]"
    else
      type_to_class(definition.type.type.to_s)
    end
  end

  def type_to_class(type)
    return 'T.untyped' unless type.present?

    case type
    when 'datetime' then 'DateTime'
    else type.camelize
    end
  end
end
