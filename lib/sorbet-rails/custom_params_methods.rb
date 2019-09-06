# typed: false
require ('sorbet-runtime')

module ITypeAssert
  extend T::Sig
  extend T::Generic

  Elem = type_member(:out)

  interface!

  sig { abstract.params(val: T.untyped).returns(Elem) }
  def assert(val); end

  def get_type(val); Elem; end
end

class TA
  extend T::Sig
  extend T::Generic
  include ITypeAssert

  Elem = type_member

  sig { implementation.params(val: T.untyped).returns(Elem) }
  def assert(val)
    val # doesn't do the assertion, maybe should raise error
  end

  # actual implementation
  def self.[](type)
    return Class.new do
      include ITypeAssert

      define_method(:assert) do |val|
        puts "internal assert #{val} #{type}"
        T.let(val, type)
      end

      define_method(:get_type) do
        type
      end
    end
  end
end

module SorbetRails
  module CustomParamsMethods
    include Kernel
    extend T::Sig
    extend T::Helpers

    # methods exists on ActionController::Parameter
    # def require(key); super; end
    # def fetch(key, *args); super; end

    sig {
      type_parameters(:U).
      params(key: Symbol, ta: ITypeAssert[T.type_parameter(:U)]).
      returns(T.type_parameter(:U))
    }
    def require_typed(key, ta)
      val = require(key)
      ta.assert(val)
    rescue TypeError
      raise ActionController::BadRequest.new(
        "Expected parameter #{key} to be an instance of type #{ta.get_type}, got #{val}"
      )
    end

    # Note: when default value is a hash, it'll be converted into an ActionController::Parameters
    sig {
      type_parameters(:U).
      params(
        key: Symbol,
        ta: ITypeAssert[T.type_parameter(:U)],
        default: T.untyped,
      ).
      returns(T.type_parameter(:U))
    }
    def fetch_typed(key, ta, *default)
      val = fetch(key, *default)
      ta.assert(val)
    rescue TypeError
      raise ActionController::BadRequest.new(
        "Expected parameter #{key} to be an instance of type T.nilable(#{type_instance.class}),
        got #{val}".squish!
      )
    end
  end
end
