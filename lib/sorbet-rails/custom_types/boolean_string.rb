# typed: false
require('sorbet-rails/deprecation.rb')

module BooleanStringImpl
  def is_a?(type)
    return super unless type == BooleanString
    _is_a_boolean_string?
  end

  def kind_of?(type)
    return super unless type == BooleanString
    _is_a_boolean_string?
  end

  def instance_of?(type)
    return super unless type == BooleanString
    _is_a_boolean_string?
  end

  def _is_a_boolean_string?
    return @cached_is_a unless @cached_is_a.nil?
    SorbetRails::TypeAssertDeprecation.deprecation_warning(
      :BooleanString,
      'Use TypedParam with T::Boolean type instead.'
    )
    @cached_is_a = (self =~ /^(true|false)$/i) == 0
  end
end

class String
  include BooleanStringImpl
end

class BooleanString < String
  def self.===(other)
    SorbetRails::TypeAssertDeprecation.deprecation_warning(
      :BooleanString,
      'Use TypedParam with T::Boolean type instead.'
    )
    other.is_a?(BooleanString)
  end
end
