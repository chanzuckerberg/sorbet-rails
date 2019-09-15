# typed: false
module IntegerStringImpl
  def is_a?(type)
    return super unless type == IntegerString
    _is_a_integer_string?
  end

  def kind_of?(type)
    return super unless type == IntegerString
    _is_a_integer_string?
  end

  def instance_of?(type)
    return super unless type == IntegerString
    _is_a_integer_string?
  end

  def _is_a_integer_string?
    return @cached_is_a unless @cached_is_a.nil?
    Integer(self, 10)
    @cached_is_a = true
  rescue ArgumentError => err
    @cached_is_a = false
  end
end

class String
  include IntegerStringImpl
end

class IntegerString < String
  def self.===(other)
    other.is_a?(IntegerString)
  end
end
