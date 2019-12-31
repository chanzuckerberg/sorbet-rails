# typed: strict
require 'sorbet-runtime'
require 'sorbet-rails/type_assert/type_assert_interface'
require 'sorbet-rails/type_assert/type_assert_impl'

class TA
  extend T::Sig
  extend T::Generic
  include ITypeAssert

  Elem = type_member

  sig { override.params(val: T.untyped).returns(Elem) }
  def assert(val)
    val # assertion happens in the Impl module
  end
end
