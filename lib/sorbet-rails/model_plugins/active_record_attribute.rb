# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordAttribute < SorbetRails::ModelPlugins::Base

  class ColumnType < T::Struct
    extend T::Sig

    const :base_type, T.any(Class, String)
    const :nilable, T.nilable(T::Boolean)
    const :array_type,  T.nilable(T::Boolean)

    sig { returns(String) }
    def to_s
      type = base_type.to_s
      type = "T.nilable(#{type})" if nilable
      type = "T::Array[#{type}]" if array_type
      type
    end
  end

  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    columns_hash = @model_class.table_exists? ? @model_class.columns_hash : {}
    return unless columns_hash.size > 0

    attribute_module_name = self.model_module_name("GeneratedAttributeMethods")
    attribute_module_rbi = root.create_module(attribute_module_name)
    attribute_module_rbi.create_extend("T::Sig")

    model_class_rbi = root.create_class(self.model_class_name)
    model_class_rbi.create_include(attribute_module_name)
    model_defined_enums = @model_class.defined_enums

    columns_hash.sort.each do |column_name, column_def|
      if model_defined_enums.has_key?(column_name)
        generate_enum_methods(
          root,
          model_class_rbi,
          attribute_module_rbi,
          model_defined_enums,
          column_name,
          column_def,
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

  sig {
    params(
      root: Parlour::RbiGenerator::Namespace,
      model_class_rbi: Parlour::RbiGenerator::Namespace,
      attribute_module_rbi:  Parlour::RbiGenerator::Namespace,
      model_defined_enums: T::Hash[String, T::Hash[String, T.untyped]],
      column_name: String,
      column_def: T.untyped,
    ).void
  }
  def generate_enum_methods(
    root,
    model_class_rbi,
    attribute_module_rbi,
    model_defined_enums,
    column_name,
    column_def
  )
    should_skip_setter_getter = false

    if @model_class.is_a?(::ActiveRecord::Enum)
      config = @model_class.typed_enum_reflections[column_name]
      if config.present?
        # do not generate the methods for enums in strict_mode
        should_skip_setter_getter = config.strict_mode

        t_enum_type = "#{@model_class.name}::#{config.class_name}"

        # define T::Enum class & values
        enum_values = T.must(model_defined_enums[column_name])
        t_enum_values = @model_class.gen_typed_enum_values(enum_values.keys)
        root.create_enum_class(
          t_enum_type,
          enums: t_enum_values.map { |k, v| [v, "'#{k}'"] },
        )

        # define t_enum setter/getter
        assignable_type = t_enum_type
        assignable_type = "T.nilable(#{assignable_type})" if column_def.null
        # add directly to model_class_rbi because they are included
        # by sorbet's hidden.rbi
        model_class_rbi.create_method(
          "typed_#{column_name}",
          return_type: assignable_type,
        )
        model_class_rbi.create_method(
          "typed_#{column_name}=",
          parameters: [
            Parameter.new("value", type: assignable_type)
          ],
          return_type: nil,
        )
      end
    end

    if !should_skip_setter_getter
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
    end
  end

  sig { params(column_def: T.untyped).returns(ColumnType) }
  def type_for_column_def(column_def)
    cast_type = ActiveRecord::Base.connection.respond_to?(:lookup_cast_type_from_column) ?
      ActiveRecord::Base.connection.lookup_cast_type_from_column(column_def) :
      column_def.cast_type

    strict_type =
      active_record_type_to_sorbet_type(
        cast_type,
        time_zone_aware: time_zone_aware_column?(column_def, cast_type),
      )

    ColumnType.new(
      base_type: strict_type,
      nilable: column_def.null,
      array_type: column_def.try(:array?),
    )
  end

  sig do
    params(
      klass: Object,
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

  sig { params(column_type: ColumnType).returns(String) }
  def value_type_for_attr_writer(column_type)
    # it's safe - and convenient - to assign any "time like" object to a time zone
    # aware attribute because Rails will cast it to a `ActiveSupport::TimeWithZone`
    # (so rereading the attribute will always return the `TimeWithZone` type)
    assignable_time_supertypes = [Date, Time, ActiveSupport::TimeWithZone].map(&:to_s)

    type = column_type.base_type
    if type.is_a?(Class)
      if type == ActiveSupport::TimeWithZone
        type = "T.any(#{assignable_time_supertypes.join(', ')})"
      elsif type < Numeric || type == ActiveSupport::Duration
        type = "T.any(Numeric, ActiveSupport::Duration)"
      elsif type == String
        type = "T.any(String, Symbol)"
      end
    end
    ColumnType.new(base_type: type, nilable: column_type.nilable, array_type: column_type.array_type).to_s
  end
end
