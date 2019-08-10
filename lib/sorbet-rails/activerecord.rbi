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
end

class ActiveRecord::AttributeMethods::TimeZoneConversion::TimeZoneConverter;
  def klass; end
end
