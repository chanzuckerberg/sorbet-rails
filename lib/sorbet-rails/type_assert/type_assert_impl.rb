# typed: ignore
require 'sorbet-runtime'

module TypeAssertImpl
  def self.included(klass)
    klass.define_singleton_method(:[]) do |*types|
      if types.length != 1
        raise Unsupported.new("TypeAssert only supports 1 type, given #{types}")
      end
      type = types.first
      return Class.new do
        include ITypeAssert

        define_method(:to_s) { "TA[#{type.to_s}]" }

        define_method(:assert) do |val|
          T.let(val, type)
        end

        define_method(:get_type) { type }
      end
    end
    klass.define_method(:rule_name) { klass.name }
  end

  class Unsupported < StandardError; end
end
