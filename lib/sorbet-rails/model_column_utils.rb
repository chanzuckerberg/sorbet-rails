# typed: strict
module SorbetRails::ModelColumnUtils
  extend T::Sig
  extend T::Helpers

  abstract!

  class ColumnType < T::Struct
    extend T::Sig

    const :base_type, T.any(Class, String)
    const :nilable, T.nilable(T::Boolean)
    const :array_type,  T.nilable(T::Boolean)

    sig { returns(String) }
    def to_s
      type = base_type.to_s
      # A nullable array column should be T.nilable(T::Array[column_type]) not T::Array[T.nilable(column_type)]
      type = "T::Array[#{type}]" if array_type
      type = "T.nilable(#{type})" if nilable && type != "T.untyped"
      type
    end
  end

  # if we're a HABTM class then model_class is an anonymous class (see the rails link below) and
  # i'm not sure how to explain that to sorbet other than T.class_of(Class).
  sig { abstract.returns(T.any(T.class_of(ActiveRecord::Base), T.class_of(Class))) }
  def model_class; end

  sig { params(column_def: T.untyped).returns(ColumnType) }
  def type_for_column_def(column_def)
    cast_type = ActiveRecord::Base.connection.respond_to?(:lookup_cast_type_from_column) ?
      ActiveRecord::Base.connection.lookup_cast_type_from_column(column_def) :
      column_def.cast_type

    array_type = false
    if column_def.try(:array?)
      cast_type = cast_type.subtype if cast_type.try(:subtype)
      array_type = true
    end
    strict_type =
      active_record_type_to_sorbet_type(
        cast_type,
        time_zone_aware: time_zone_aware_column?(column_def, cast_type),
      )

    ColumnType.new(
      base_type: strict_type,
      nilable: nilable_column?(column_def),
      array_type: array_type,
    )
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
    model_class.send(
      :create_time_zone_conversion_attribute?,
      column_def.name,
      cast_type
    )
  end

  sig { params(column_def: T.untyped).returns(T::Boolean) }
  def nilable_column?(column_def)
    !!(column_def.null && !attribute_has_unconditional_presence_validation?(column_def.name))
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
      # For Postgres UUIDs, they're represented as Strings
      when Object.const_defined?('ActiveRecord::ConnectionAdapters::PostgreSQL::OID::Uuid') && klass.is_a?(ActiveRecord::ConnectionAdapters::PostgreSQL::OID::Uuid)
        String
      else
        "T.untyped"
      end
    end
  end

  sig { params(attribute: T.any(String, Symbol)).returns(T::Boolean) }
  def attribute_has_unconditional_presence_validation?(attribute)
    model_class_srb = model_class
    model_class_srb < ActiveRecord::Base &&
    model_class_srb.validators_on(attribute).any? do |validator|
      validator.is_a?(ActiveModel::Validations::PresenceValidator) &&
        !validator.options.key?(:if) &&
        !validator.options.key?(:unless) &&
        !validator.options.key?(:on)
    end
  end
end
