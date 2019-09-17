# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordAttribute < SorbetRails::ModelPlugins::Base

  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
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
        return_type = "String"
        return_type = "T.nilable(#{return_type})" if column_def.null

        attribute_module_rbi.create_method(
          column_name.to_s,
          return_type: return_type,
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
            Parameter.new("value", type: value_type_for_attr_writer(column_type))
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

  sig { params(column_def: T.untyped).returns(T.any(String, Class)) }
  def type_for_column_def(column_def)
    cast_type = ActiveRecord::Base.connection.respond_to?(:lookup_cast_type_from_column) ?
      ActiveRecord::Base.connection.lookup_cast_type_from_column(column_def) :
      column_def.cast_type

    strict_type =
      active_record_type_to_sorbet_type(
        cast_type,
        time_zone_aware: time_zone_aware_column?(column_def, cast_type),
      )

    if column_def.respond_to?(:array?) && column_def.array?
      strict_type = "T::Array[#{strict_type}]"
    end
    column_def.null ? "T.nilable(#{strict_type})" : strict_type
  end

  sig do
    params(
      # in v4.2, datetime can be TimeZoneConverter
      klass: T.any(Object, ActiveRecord::AttributeMethods::TimeZoneConversion::TimeZoneConverter),
      time_zone_aware: T::Boolean,
    ).returns(T.any(String, Class))
  end
  def active_record_type_to_sorbet_type(klass, time_zone_aware: false)
    case klass
    when ActiveRecord::Type::Boolean
      "T::Boolean"
    when ActiveRecord::Type::DateTime, ActiveRecord::Type::Time
      time_zone_aware ? ActiveSupport::TimeWithZone : Time
    when ActiveRecord::Type::Date
      Date
    when ActiveRecord::AttributeMethods::TimeZoneConversion::TimeZoneConverter
      # if type has already been decorated with TimeZoneConverter, it's probably
      # a Rails 4.2 datetime column and can be considered a TimeWithZone
      ActiveSupport::TimeWithZone
    when ActiveRecord::Type::Decimal
      BigDecimal
    when ActiveRecord::Type::Float
      Float
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

  # True if this column is "time zone aware", which means it'll be converted on
  # access from its original class (e.g. `DateTime`) to something with better
  # support for time zones (usually `ActiveSupport::TimeWithZone`)
  sig do
    params(column_def: T.untyped, cast_type: T.untyped).returns(T::Boolean)
  end
  def time_zone_aware_column?(column_def, cast_type)
    # this private class method returns true if the attribute should be "time
    # zone aware"; it takes into account various global and model-specific
    # configuration options as described here:
    # https://api.rubyonrails.org/classes/ActiveRecord/Timestamp.html
    #
    # although it's private, it's better this than trying to reimplement the "is
    # this attribute tz aware?" logic ourselves
    @model_class.send(
      :create_time_zone_conversion_attribute?,
      column_def.name,
      cast_type
    )
  end

  sig { params(column_type: Object).returns(String) }
  def value_type_for_attr_writer(column_type)
    assignable_time_types = [DateTime, Date, Time, ActiveSupport::TimeWithZone].map(&:to_s)

    # it's safe - and convenient - to assign any "time like" object to a time zone
    # aware attribute because Rails will cast it to a `ActiveSupport::TimeWithZone`
    # (so rereading the attribute will always return the `TimeWithZone` type)
    if column_type == ActiveSupport::TimeWithZone
      "T.any(#{assignable_time_types.join(', ')})"
    elsif column_type == "T.nilable(ActiveSupport::TimeWithZone)"
      "T.nilable(T.any(#{assignable_time_types.join(', ')}))"
    else
      column_type.to_s
    end
  end
end
