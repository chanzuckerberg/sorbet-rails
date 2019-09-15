# typed: ignore
require 'sorbet-runtime'

if !$PROGRAM_NAME.include?('sorbet')
  module TypeAssertImpl
    def self.included(klass)
      klass.define_singleton_method(:[]) do |type|
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
  end

  class TA
    include TypeAssertImpl
  end
end