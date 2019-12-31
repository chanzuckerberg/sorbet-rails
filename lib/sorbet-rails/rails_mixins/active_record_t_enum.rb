# typed: false

module SorbetRails::ActiveRecordTEnum
  extend T::Sig
  extend T::Helpers
  include Kernel

  abstract!

  class TEnumConfig < T::Struct
    # set the method to be true or false
    const :strict_mode, T::Boolean
    const :class_name, String
  end

  sig { abstract.returns(T::Hash[Symbol, T::Hash[String, T.untyped]]) }
  def defined_enums; end

  sig { returns(T::Hash[String, TEnumConfig]) }
  def t_enum_config
    # this config is for sorbet-rails to inflect on the settings
    @t_enum_config ||= {}
  end

  sig {
    params(
      enum_name: Symbol,
      strict_mode: T::Boolean,
      t_enum_name: T.nilable(String),
    ).void
  }
  def enable_t_enum(enum_name, strict_mode: false, t_enum_name: nil)
    enum_name = enum_name.to_s
    enum_values = defined_enums[enum_name]
    raise UndefinedEnum.new(
      "Enum #{enum_name} is not defined in model #{self.name}"
    ) if enum_values.nil?

    enum_klass_name = t_enum_name || enum_name.camelize

    # update config
    t_enum_config[enum_name] = TEnumConfig.new(
      strict_mode: strict_mode,
      class_name: enum_klass_name,
    )

    # we don't need to use the actual enum value
    t_enum_values = gen_t_enum_values(enum_values.keys)

    # create dynamic T::Enum definition
    enum_klass = Class.new(T::Enum) do
      enums do
        t_enum_values.each do |enum_type_name, t_enum_name|
          const_set(t_enum_name, new(enum_type_name))
        end
      end
    end
    const_set(enum_klass_name, enum_klass)

    # create t_enum getter to get T::Enum value
    # assuming there shouldn't be any conflict
    define_method("t_#{enum_name}") do
      T.unsafe(enum_klass).try_deserialize(send(enum_name))
    end

    # override the setter to accept T::Enum values
    enum_setter_name = "#{enum_name}="
    t_enum_setter_name = "t_#{enum_name}="
    define_method(t_enum_setter_name) do |value|
      send(enum_setter_name, value.serialize)
    end
  end

  sig { params(enum_values: T::Array[String]).returns(T::Hash[String, String]) }
  def gen_t_enum_values(enum_values)
    Hash[enum_values.map do |val|
      [val, val.gsub(/[^0-9a-z_]/i, '').camelize]
    end]
  end

  class UndefinedEnum < StandardError; end
end
