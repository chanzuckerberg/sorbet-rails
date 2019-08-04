# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordAttribute < SorbetRails::ModelPlugins::Base

  sig { implementation.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    columns_hash = @model_class.table_exists? ? @model_class.columns_hash : {}
    return unless columns_hash.size > 0

    attribute_module_name = self.model_module_name("GeneratedAttributeMethods")
    attribute_module_rbi = root.create_module(attribute_module_name)
    attribute_module_rbi.create_extend("T::Sig")

    model_class_rbi = root.create_class(self.model_class_name)
    model_class_rbi.create_include(attribute_module_name)

    columns_hash.sort.each do |column_name, column_def|
      if @model_class.defined_enums.has_key?(column_name)
        # enum attribute is treated differently
        assignable_type = "T.any(Integer, String, Symbol)"
        assignable_type = "T.nilable(#{assignable_type})" if column_def.null

        attribute_module_rbi.create_method(
          column_name.to_s,
          return_type: "String",
        )
        attribute_module_rbi.create_method(
          "#{column_name}=",
          parameters: [
            Parameter.new("value", type: assignable_type)
          ],
          return_type: nil,
        )
      else
        column_type = type_for_column_def(column_def)
        attribute_module_rbi.create_method(
          column_name.to_s,
          return_type: column_type.to_s,
        )
        attribute_module_rbi.create_method(
          "#{column_name}=",
          parameters: [
            Parameter.new("value", type: column_type.to_s)
          ],
          return_type: nil,
        )
      end

      attribute_module_rbi.create_method(
        "#{column_name}?",
        return_type: "T::Boolean",
      )
    end
  end

  sig {params(column_def: T.untyped).returns(T.any(String, Class))}
  def type_for_column_def(column_def)
    cast_type = ActiveRecord::Base.connection.respond_to?(:lookup_cast_type_from_column) ?
      ActiveRecord::Base.connection.lookup_cast_type_from_column(column_def) :
      column_def.cast_type

    strict_type = active_record_type_to_sorbet_type(cast_type)

    if column_def.respond_to?(:array?) && column_def.array?
      strict_type = "T::Array[#{strict_type}]"
    end
    column_def.null ? "T.nilable(#{strict_type})" : strict_type
  end

  sig {
    params(
      # in v4.2, datetime can be TimeZoneConverter
      klass: T.any(Object, ActiveRecord::AttributeMethods::TimeZoneConversion::TimeZoneConverter)
    ).
    returns(T.any(String, Class))
  }
  def active_record_type_to_sorbet_type(klass)
    case klass
    when ActiveRecord::Type::Boolean
      "T::Boolean"
    when ActiveRecord::Type::DateTime
      DateTime
    when ActiveRecord::Type::Date
      Date
    when ActiveRecord::AttributeMethods::TimeZoneConversion::TimeZoneConverter
      klass.klass
    when ActiveRecord::Type::Decimal
      BigDecimal
    when ActiveRecord::Type::Float
      Float
    when ActiveRecord::Type::Time
      Time
    when ActiveRecord::Type::BigInteger, ActiveRecord::Type::Integer, ActiveRecord::Type::DecimalWithoutScale, ActiveRecord::Type::UnsignedInteger
      Integer
    when ActiveRecord::Type::Binary, ActiveRecord::Type::String, ActiveRecord::Type::Text
      String
    else
      # Json type is only supported in Rails 5.2 and above
      case
      when Object.const_defined?('ActiveRecord::Type::Json') && klass.is_a?(ActiveRecord::Type::Json)
        "T.any(T::Array[T.untyped], T::Boolean, Float, T::Hash[T.untyped, T.untyped], Integer, String)"
      when Object.const_defined?('ActiveRecord::Enum::EnumType') && klass.is_a?(ActiveRecord::Enum::EnumType)
        String
      else
        "T.untyped"
      end
    end
  end
end
