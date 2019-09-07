# typed: ignore
require 'sorbet-runtime'

module TypeAssertImpl
  include Kernel
  def [](type)
    return Class.new do
      include ITypeAssert

      define_method(:to_s) { "TA[#{type.to_s}]" }

      define_method(:assert) do |val|
        T.let(val, type)
      end

      define_method(:get_type) { type }
    end
  end
end
