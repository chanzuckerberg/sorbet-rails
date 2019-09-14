# typed: strong

module ITypeAssert
  extend T::Sig
  extend T::Generic

  Elem = type_member(:out)

  abstract!

  sig { abstract.params(val: T.untyped).returns(Elem) }
  def assert(val); end
end

module TypeAssertImpl; end

class TA
  extend T::Sig
  extend T::Generic
  include ITypeAssert
  extend TypeAssertImpl

  Elem = type_member

  sig { override.params(val: T.untyped).returns(Elem) }
  def assert(val); end
end

module SorbetRails::CustomParamsMethods
  extend T::Sig

  sig {
    type_parameters(:U).
    params(key: Symbol, ta: ITypeAssert[T.type_parameter(:U)]).
    returns(T.type_parameter(:U))
  }
  def require_typed(key, ta); end

  # Note: when default value is a hash, it'll be converted into an ActionController::Parameters
  sig {
    type_parameters(:U).
    params(
      key: Symbol,
      ta: ITypeAssert[T.type_parameter(:U)],
      args: T.untyped,
    ).
    returns(T.type_parameter(:U))
  }
  def fetch_typed(key, ta, *args); end
end
