# typed: true
module T
  module Coerce
    extend T::Sig
    extend T::Generic

    Elem = type_member

    sig { params(args: T.untyped, raise_coercion_error: T.nilable(T::Boolean)).returns(Elem) }
    def from(args, raise_coercion_error: nil); end

    class CoercionError < StandardError; end
    class ShapeError < StandardError; end
  end

  module Private
    module Types
      class TypeAlias
        def aliased_type; end
      end
    end
  end
end
