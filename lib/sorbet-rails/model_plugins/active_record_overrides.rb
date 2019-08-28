# typed: false

require 'singleton'

class ActiveRecordOverrides
  include Singleton

  attr_reader :enum_calls

  def initialize
    @enum_calls = {}
  end

  def store_enum_call(class_name, kwargs)
    @enum_calls[class_name] ||= []
    @enum_calls[class_name] << kwargs
  end
end

module ::ActiveRecord::Enum
  alias old_enum enum

  def enum(*args, **kwargs)
    ActiveRecordOverrides.instance.store_enum_call(T.unsafe(self).name, kwargs)
    old_enum(*args, **kwargs)
  end
end
