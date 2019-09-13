# typed: true
require ('sorbet-runtime')

module ITypeAssert
  extend T::Sig
  extend T::Generic

  Elem = type_member(:out)

  abstract!

  sig { abstract.params(val: T.untyped).returns(Elem) }
  def assert(val); end

  def get_type; Elem; end
end
