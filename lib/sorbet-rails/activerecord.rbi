# typed: strong

class ActiveRecord::Base
  extend T::Sig

  sig { returns(T::Boolean) }
  def self.table_exists?; end

  sig { returns(T::Hash[String, T::Hash[String, T.untyped]]) }
  def self.defined_enums; end

  sig { returns(T::Hash[Symbol, T.untyped]) }
  def self.columns_hash; end

  sig { returns(T::Hash[Symbol, T.untyped]) }
  def self.reflections; end
end
