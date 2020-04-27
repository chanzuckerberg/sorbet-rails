# This is an autogenerated file for dynamic methods in ActiveRecord::InternalMetadata
# Please rerun bundle exec rake rails_rbi:models[ActiveRecord::InternalMetadata] to regenerate.

# typed: strong
module ActiveRecord::InternalMetadata::ActiveRelation_WhereNot
  sig { params(opts: T.untyped, rest: T.untyped).returns(T.self_type) }
  def not(opts, *rest); end
end

module ActiveRecord::InternalMetadata::GeneratedAttributeMethods
  extend T::Sig

  sig { returns(ActiveSupport::TimeWithZone) }
  def created_at; end

  sig { params(value: T.any(Date, Time, ActiveSupport::TimeWithZone)).void }
  def created_at=(value); end

  sig { returns(T::Boolean) }
  def created_at?; end

  sig { returns(String) }
  def key; end

  sig { params(value: T.any(String, Symbol)).void }
  def key=(value); end

  sig { returns(T::Boolean) }
  def key?; end

  sig { returns(ActiveSupport::TimeWithZone) }
  def updated_at; end

  sig { params(value: T.any(Date, Time, ActiveSupport::TimeWithZone)).void }
  def updated_at=(value); end

  sig { returns(T::Boolean) }
  def updated_at?; end

  sig { returns(T.nilable(String)) }
  def value; end

  sig { params(value: T.nilable(T.any(String, Symbol))).void }
  def value=(value); end

  sig { returns(T::Boolean) }
  def value?; end
end

module ActiveRecord::InternalMetadata::CustomFinderMethods
  sig { params(limit: Integer).returns(T::Array[ActiveRecord::InternalMetadata]) }
  def first_n(limit); end

  sig { params(limit: Integer).returns(T::Array[ActiveRecord::InternalMetadata]) }
  def last_n(limit); end

  sig { params(args: T::Array[T.any(Integer, String)]).returns(T::Array[ActiveRecord::InternalMetadata]) }
  def find_n(*args); end

  sig { params(id: Integer).returns(T.nilable(ActiveRecord::InternalMetadata)) }
  def find_by_id(id); end

  sig { params(id: Integer).returns(ActiveRecord::InternalMetadata) }
  def find_by_id!(id); end
end

class ActiveRecord::InternalMetadata < ActiveRecord::Base
  include ActiveRecord::InternalMetadata::GeneratedAttributeMethods
  extend ActiveRecord::InternalMetadata::CustomFinderMethods
  extend T::Sig
  extend T::Generic
  RelationType = T.type_alias { T.any(ActiveRecord::InternalMetadata::ActiveRecord_Relation, ActiveRecord::InternalMetadata::ActiveRecord_Associations_CollectionProxy, ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }

  sig { returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.all; end

  sig { params(block: T.nilable(T.proc.void)).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.unscoped(&block); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.select(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.order(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.reorder(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.group(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.limit(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.offset(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.left_joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.where(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.rewhere(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.preload(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.eager_load(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.includes(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.from(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.lock(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.readonly(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.or(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.having(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.create_with(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.distinct(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.references(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.none(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.unscope(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.merge(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.extending(*args, &block); end
end

class ActiveRecord::InternalMetadata::ActiveRecord_Relation < ActiveRecord::Relation
  include ActiveRecord::InternalMetadata::ActiveRelation_WhereNot
  include ActiveRecord::InternalMetadata::CustomFinderMethods
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: ActiveRecord::InternalMetadata)

  sig { returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def extending(*args, &block); end
end

class ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  include ActiveRecord::InternalMetadata::ActiveRelation_WhereNot
  include ActiveRecord::InternalMetadata::CustomFinderMethods
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: ActiveRecord::InternalMetadata)

  sig { returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end
end

class ActiveRecord::InternalMetadata::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  include ActiveRecord::InternalMetadata::CustomFinderMethods
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: ActiveRecord::InternalMetadata)

  sig { returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end

  sig { params(records: T.any(ActiveRecord::InternalMetadata, T::Array[ActiveRecord::InternalMetadata])).returns(T.self_type) }
  def <<(*records); end

  sig { params(records: T.any(ActiveRecord::InternalMetadata, T::Array[ActiveRecord::InternalMetadata])).returns(T.self_type) }
  def append(*records); end

  sig { params(records: T.any(ActiveRecord::InternalMetadata, T::Array[ActiveRecord::InternalMetadata])).returns(T.self_type) }
  def push(*records); end

  sig { params(records: T.any(ActiveRecord::InternalMetadata, T::Array[ActiveRecord::InternalMetadata])).returns(T.self_type) }
  def concat(*records); end
end
