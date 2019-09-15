# typed: false

require 'singleton'

class ActiveRecordOverrides
  include Singleton

  attr_reader :enum_calls

  def initialize
    @enum_calls = {}
  end

  def store_enum_call(klass, kwargs)
    class_name = klass.name
    @enum_calls[class_name] ||= {}
    # modeling the logic in
    # https://github.com/rails/rails/blob/master/activerecord/lib/active_record/enum.rb#L152
    kwargs.each do |name, values|
      next if [:_prefix, :_suffix, :_scopes].include?(name)
      @enum_calls[class_name][name] = kwargs
    end
  end

  def get_enum_call(klass, enum_sym)
    return nil if klass == Object
    class_name = klass.name
    class_enum_calls = @enum_calls[klass.name]
    return class_enum_calls[enum_sym] if class_enum_calls && class_enum_calls.has_key?(enum_sym)
    return get_enum_call(klass.superclass, enum_sym)
  end
end

module ::ActiveRecord::Enum
  alias old_enum enum

  def enum(*args, **kwargs)
    ActiveRecordOverrides.instance.store_enum_call(self, kwargs)
    old_enum(*args, **kwargs)
  end
end
