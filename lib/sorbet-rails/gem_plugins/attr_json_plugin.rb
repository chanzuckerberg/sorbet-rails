# typed: false
class AttrJsonPlugin < SorbetRails::ModelPlugins::Base
  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    return unless @model_class.include?(::AttrJson::Record)

    # Module for instance methods
    obj_custom_module_name = self.model_module_name("GeneratedAttrJsonMethods")
    obj_custom_module_rbi = root.create_module(obj_custom_module_name)

    # Module for class methods
    klass_custom_module_name = self.model_module_name("GeneratedAttrJsonClassMethods")
    klass_custom_module_rbi = root.create_module(klass_custom_module_name)

    # here we re-create the model class!
    model_class_rbi = root.create_class(self.model_class_name)
    model_class_rbi.create_include(obj_custom_module_name)
    model_class_rbi.create_extend(klass_custom_module_name)

    # then create custom methods, constants, etc. for this module.
    add_class_methods(klass_custom_module_rbi)

    @model_class.attr_json_registry.definitions.each do |definition|
      add_methods_for_attributes(definition, obj_custom_module_rbi)
    end

    if @model_class.include?(::AttrJson::Record::Dirty)
      obj_custom_module_rbi.create_method(
        'attr_json_changes',
        returns: 'AttrJson::Record::Dirty::Implementation'
      )
    end
  end

  private

  sig { params(custom_module_rbi: Parlour::RbiGenerator::ModuleNamespace).void }
  def add_class_methods(custom_module_rbi)
    custom_module_rbi.create_method(
      'attr_json_config',
      parameters: [
        ::Parlour::RbiGenerator::Parameter.new(
          'new_values',
          type: 'T.nilable(T::Hash[Symbol, T.untyped])'
        )
      ],
      returns: 'T::Hash[Symbol, T.untyped]'
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
      ]
    )
  end

  sig do
    params(
      definition: ::AttrJson::AttributeDefinition,
      custom_module_rbi: Parlour::RbiGenerator::ModuleNamespace
    )
    .void
  end
  def add_methods_for_attributes(definition, custom_module_rbi)
    # set methods can receive an argument of any type because attr_json will try
    # to parse to the correct type. Example:
    #
    # class Post < ApplicationRecord
    #   ...
    #   attr_json :my_datetime, :datetime
    # end
    #
    # > p = Post.new
    # > (p.my_datetime = '2020-02-02').class
    # => String
    # > p.my_datetime.class
    # => Time
    #
    # Also, the setter type return is the same as its argument type (before parse).
    custom_module_rbi.create_method(
      "#{definition.name}=",
      parameters: [
        ::Parlour::RbiGenerator::Parameter.new(
          'value',
          type: 'T.untyped'
        )
      ],
      returns: 'T.untyped'
    )

    definition_type = get_definition_type(definition)

    custom_module_rbi.create_method(
      definition.name.to_s,
      returns: definition_type
    )

    custom_module_rbi.create_method(
      "#{definition.name}?",
      returns: 'T::Boolean'
    )
  end

  sig { params(definition: ::AttrJson::AttributeDefinition).returns(String) }
  def get_definition_type(definition)

    if definition.array_type?
      "T::Array[#{type_to_class(definition.type.base_type.type.to_s)}]"
    else
      "T.nilable(#{type_to_class(definition.type.type.to_s)})"
    end
  end

  sig { params(type: String).returns(String) }
  def type_to_class(type)
    return 'T.untyped' unless type.present?

    case type
    when 'datetime' then 'Time'
    when 'decimal' then 'BigDecimal'
    when 'boolean' then 'T::Boolean'
    else type.camelize
    end
  end
end
