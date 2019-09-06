# typed: false
require ('sorbet-runtime')

module TI
  # Typed instance, need to special case Integer
  Integer = T.let(0, ::Integer)
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
      params(key: Symbol, type_instance: T.type_parameter(:U)).
      returns(T.type_parameter(:U))
    }
    def require_typed(key, type_instance)
      val = require(key)
      if val.is_a?(type_instance.class)
        val
      else
        raise ActionController::BadRequest.new(
          "Expected parameter #{key} to be an instance of type #{type_instance.class}, got #{val}"
        )
      end
    end

    # Note: when default value is a hash, it'll be converted into an ActionController::Parameters
    sig {
      type_parameters(:U).
      params(
        key: Symbol,
        type_instance: T.type_parameter(:U),
        default: T.untyped,
      ).
      returns(T.type_parameter(:U))
    }
    def fetch_typed(key, type_instance, *default)
      val = fetch(key, *default)
      if val.nil? || val.is_a?(type_instance.class)
        val
      else
        raise ActionController::BadRequest.new(
          "Expected parameter #{key} to be an instance of type T.nilable(#{type_instance.class}),
          got #{val}".squish!
        )
      end
    end
  end
end
