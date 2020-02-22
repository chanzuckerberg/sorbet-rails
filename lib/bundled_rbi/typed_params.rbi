# typed: true
module TypedParams
  extend T::Generic

  Elem = type_member

  sig { params(args: ActionController::Parameters).returns(Elem) }
  def extract!(args); end
end
