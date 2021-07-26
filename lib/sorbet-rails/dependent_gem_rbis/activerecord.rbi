# typed: strong

class ActiveRecord::Base < Object
  extend T::Sig

  sig { returns(T::Boolean) }
  def self.table_exists?; end

  sig { returns(T::Hash[String, T::Hash[String, T.untyped]]) }
  def self.defined_enums; end

  sig { returns(T::Hash[String, T.untyped]) }
  def self.columns_hash; end

  sig { params(column_name: String).returns(T.nilable(T.any(ActiveModel::Type::Value, ActiveRecord::Type::Serialized))) }
  def self.type_for_attribute(column_name); end

  sig { returns(T::Hash[String, T.untyped]) }
  def self.reflections; end

  sig { returns(T.untyped) }
  def self.connection; end

  sig { returns(T::Boolean) }
  def self.abstract_class?; end

  sig { returns(T::Hash[String, T.untyped]) }
  def self.attachment_reflections; end
end

class ActiveRecord::AttributeMethods::TimeZoneConversion::TimeZoneConverter;
  def klass; end
end

class ActiveModel::Validations::PresenceValidator
  sig { returns(T::Hash[T.untyped, T.untyped]) }
  attr_reader :options
end

module ActiveModel::Validations
  module ClassMethods
    def validators_on(*attributes); end
  end
end

class ActiveRecord::Type::Serialized
  def coder; end
end
