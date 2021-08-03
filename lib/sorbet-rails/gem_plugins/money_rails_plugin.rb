# typed: strict
class MoneyRailsPlugin < SorbetRails::ModelPlugins::Base
  sig { params(attribute: T.any(Symbol, String)).returns(T::Boolean) }
  def allows_nil(attribute)
    validators = model_class.validators_on(attribute)
    return false if validators.empty?

    validators.any? do |validator|
      validator.respond_to?(:options) &&
        validator.options[:allow_nil]
    end
  end

  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    return unless exists_class_method?(:monetize)

    # money-rails gives us a hash mapping the monetized attribute to its subunit
    # equivalent, eg: `{"price": "price_cents"}`
    monetized_attributes = T.let(
      T.unsafe(model_class).monetized_attributes,
      T::Hash[String,String]
    )

    return if monetized_attributes.empty?

    module_name = model_module_name("GeneratedMoneyRailsMethods")
    module_rbi = root.create_module(module_name)

    model_class_rbi = root.create_class(model_class_name)
    model_class_rbi.create_include(module_name)

    monetized_attributes.each do |name, subunit_name|
      validators = model_class.validators_on(name)

      money_attribute_type = allows_nil(name) ? "T.nilable(::Money)" : "::Money"
      subunit_attribute_type = allows_nil(name) ? "T.nilable(Integer)" : "Integer"

      module_rbi.create_method(
        name,
        return_type: money_attribute_type
      )

      module_rbi.create_method(
        subunit_name,
        return_type: subunit_attribute_type
      )

      module_rbi.create_method(
        "#{name}_money_before_type_cast",
        return_type: 'T.untyped'
      )

      module_rbi.create_method(
        "#{name}=",
        parameters:  [
           Parlour::RbiGenerator::Parameter.new("value", type: money_attribute_type)
        ],
        return_type: nil
      )

      module_rbi.create_method(
        "#{subunit_name}=",
        parameters:  [
           Parlour::RbiGenerator::Parameter.new("value", type: subunit_attribute_type)
        ],
        return_type: nil
      )

      module_rbi.create_method(
        "currency_for_#{name}",
        return_type: "T.nilable(::Money::Currency)"
      )
    end
  end
end
