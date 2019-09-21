# typed: strong

class ActiveRecord::Base < Object
  extend T::Sig

  sig { returns(T::Boolean) }
  def self.table_exists?; end

  sig { returns(T::Hash[String, T::Hash[String, T.untyped]]) }
  def self.defined_enums; end

  sig { returns(T::Hash[String, T.untyped]) }
  def self.columns_hash; end

  sig { returns(T::Hash[String, T.untyped]) }
  def self.reflections; end

  sig { returns(T.untyped) }
  def self.connection; end

  sig { returns(T::Boolean) }
  def self.abstract_class?; end

  sig { returns(T::Hash[String, T.untyped]) }
  def self.attachment_reflections; end
end

module ActiveRecord::Core
  extend T::Sig

  sig { params(other_object: T.untyped).returns(T.nilable(Integer)) }
  def <=>(other_object); end

  sig { params(comparison_object: T.untyped).returns(T::Boolean) }
  def ==(comparison_object); end

  sig { returns(ActiveRecord::ConnectionAdapters::ConnectionHandler) }
  def connection_handler; end

  sig { returns(T::Boolean) }
  def custom_inspect_method_defined?; end

  sig { params(comparison_object: T.untyped).returns(T::Boolean) }
  def eql?(comparison_object); end

  sig { returns(T::Boolean) }
  def frozen?; end

  sig { returns(Integer) }
  def hash; end

  sig { returns(String) }
  def inspect; end

  sig { returns(TrueClass) }
  def readonly!; end

  sig { returns(T::Boolean) }
  def readonly?; end

  extend ActiveSupport::Concern
end

class ActiveRecord::AttributeMethods::TimeZoneConversion::TimeZoneConverter;
  def klass; end
end
