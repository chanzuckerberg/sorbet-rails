# typed: false

require 'singleton'

class ActiveRecordOverrides
  include Singleton

  attr_reader :enum_calls

  def initialize
    @enum_calls = {}
  end

  def store_enum_call(klass, kwargs)
    class_name = klass.name
    @enum_calls[class_name] ||= {}
    # modeling the logic in
    # https://github.com/rails/rails/blob/master/activerecord/lib/active_record/enum.rb#L152
    kwargs.each do |name, values|
      next if ::ActiveRecord::Enum::SR_ENUM_KEYWORDS.include?(name)

      # calling dup is required, because Rails internally mutates `kwargs` (the args you passed to `enum`)
      @enum_calls[class_name][name] = kwargs.dup
    end
  end

  def get_enum_call(klass, enum_sym)
    return nil if klass == Object
    class_name = klass.name
    class_enum_calls = @enum_calls[klass.name]
    return class_enum_calls[enum_sym] if class_enum_calls && class_enum_calls.has_key?(enum_sym)
    return get_enum_call(klass.superclass, enum_sym)
  end
end

class SorbetRails::TypedEnumConfig < T::Struct
  # set the method to be true or false
  const :strict_mode, T::Boolean
  const :class_name, String
end

module ::ActiveRecord::Enum
  extend T::Sig
  include Kernel

  alias old_enum enum

  SR_ENUM_KEYWORDS = [
    # keywords from https://github.com/rails/rails/blob/master/activerecord/lib/active_record/enum.rb
    :_prefix,
    :_suffix,
    :_scopes
  ]

  sig { params(definitions: T::Hash[Symbol, T.untyped]).void }
  def _define_enum(definitions)
    ActiveRecordOverrides.instance.store_enum_call(self, definitions)
    old_enum(**definitions)
  end

  sig { params(definitions: T::Hash[Symbol, T.untyped]).void }
  def enum(definitions)
    _define_enum(definitions)
    definitions.each do |enum_name, values|
      begin
        # skip irrelevant keywords
        next if SR_ENUM_KEYWORDS.include?(enum_name)
        _define_typed_enum(enum_name, extract_enum_values(values))
      rescue ArgumentError, ConflictTypedEnumNameError, TypeError => ex
        # known errors
        # do nothing if we cannot define t_enum
        puts "warning: #{ex.message}"
      rescue => ex
        # rescue any other kind of error to unblock the application
        # can be disabled in development
        puts "warning: #{ex.message}"
        # raise ex
      end
    end
  end

  sig { params(definitions: T::Hash[Symbol, T.untyped]).void }
  def typed_enum(definitions)
    enum_names = definitions.keys - SR_ENUM_KEYWORDS

    if enum_names.size != 1
      raise MultipleEnumsDefinedError.new(
        "typed_enum only supports 1 enum defined at a time,
        given #{enum_names.count}: #{enum_names.join(', ')}".squish!
      )
    end

    enum_name = enum_names[0]

    _define_enum(definitions)
    _define_typed_enum(
      T.must(enum_name),
      extract_enum_values(definitions[enum_name]),
      strict_mode: true,
    )
  end

  # this config is for sorbet-rails to inflect on the settings
  sig { returns(T::Hash[String, SorbetRails::TypedEnumConfig]) }
  def typed_enum_reflections
    @typed_enum_reflections ||= {}
  end

  sig {
    params(
      enum_name: Symbol,
      enum_values: T::Array[Symbol],
      strict_mode: T::Boolean,
    ).
    void
  }
  def _define_typed_enum(
    enum_name,
    enum_values,
    strict_mode: false
  )
    enum_klass_name = enum_name.to_s.camelize

    # we don't need to use the actual enum value
    typed_enum_values = gen_typed_enum_values(enum_values.map(&:to_s))

    # create dynamic T::Enum definition
    if const_defined?(enum_klass_name)
      # append Enum to avoid conflict
      enum_klass_name = "#{enum_klass_name}Enum"
      if const_defined?(enum_klass_name)
        raise ConflictTypedEnumNameError.new(
          "Unable to define enum class #{enum_klass_name} because
          it's already defined".squish!
        )
      end
    end
    enum_klass = Class.new(T::Enum) do
      enums do
        typed_enum_values.each do |enum_key_name, typed_enum_value|
          const_set(typed_enum_value, new(enum_key_name))
        end
      end
    end
    const_set(enum_klass_name, enum_klass)

    # create t_enum getter to get T::Enum value
    # assuming there shouldn't be any conflict
    typed_enum_getter_name = "typed_#{enum_name}"
    detect_enum_conflict!(enum_name, typed_enum_getter_name)
    define_method(typed_enum_getter_name) do
      T.unsafe(enum_klass).try_deserialize(send(enum_name))
    end

    # override the setter to accept T::Enum values
    enum_setter_name = "#{enum_name}="
    typed_enum_setter_name = "typed_#{enum_name}="
    detect_enum_conflict!(enum_name, typed_enum_setter_name)
    define_method(typed_enum_setter_name) do |value|
      send(enum_setter_name, value&.serialize)
    end

    # add to the config for RBI generation only if it works
    typed_enum_reflections[enum_name.to_s] = SorbetRails::TypedEnumConfig.new(
      strict_mode: strict_mode || false,
      class_name: enum_klass_name,
    )
  end

  sig { params(enum_values: T::Array[String]).returns(T::Hash[String, String]) }
  def gen_typed_enum_values(enum_values)
    Hash[enum_values.map do |val|
      [val, val.to_s.gsub(/[^0-9a-z_]/i, '').camelize]
    end]
  end

  sig {
    params(
      enum_def: T.any(
        T::Array[T.untyped],
        T::Hash[T.untyped, T.untyped],
        ActiveSupport::HashWithIndifferentAccess
      ),
    ).returns(T::Array[Symbol])
  }
  def extract_enum_values(enum_def)
    enum_def.is_a?(Array) ? enum_def.map(&:to_sym) : enum_def.keys.map(&:to_sym)
  end

  class MultipleEnumsDefinedError < StandardError; end
  class ConflictTypedEnumNameError < StandardError; end
end
