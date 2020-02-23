# typed: true
module TypedParams
  extend T::Generic

  Elem = type_member

  sig { params(args: ActionController::Parameters, raise_coercion_error: T.nilable(T::Boolean)).returns(Elem) }
  def extract!(args, raise_coercion_error: nil); end
end
