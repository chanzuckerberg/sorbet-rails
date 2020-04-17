# This is an autogenerated file for dynamic methods in ActiveRecord::SchemaMigration
# Please rerun bundle exec rake rails_rbi:models[ActiveRecord::SchemaMigration] to regenerate.

# typed: strong
module ActiveRecord::SchemaMigration::ActiveRelation_WhereNot
  sig { params(opts: T.untyped, rest: T.untyped).returns(T.self_type) }
  def not(opts, *rest); end
end

module ActiveRecord::SchemaMigration::GeneratedAttributeMethods
  extend T::Sig

  sig { returns(String) }
  def version; end

  sig { params(value: T.any(String, Symbol)).void }
  def version=(value); end

  sig { returns(T::Boolean) }
  def version?; end
end

module ActiveRecord::SchemaMigration::CustomFinderMethods
  sig { params(limit: Integer).returns(T::Array[ActiveRecord::SchemaMigration]) }
  def first_n(limit); end

  sig { params(limit: Integer).returns(T::Array[ActiveRecord::SchemaMigration]) }
  def last_n(limit); end

  sig { params(args: T::Array[T.any(Integer, String)]).returns(T::Array[ActiveRecord::SchemaMigration]) }
  def find_n(*args); end

  sig { params(id: Integer).returns(T.nilable(ActiveRecord::SchemaMigration)) }
  def find_by_id(id); end

  sig { params(id: Integer).returns(ActiveRecord::SchemaMigration) }
  def find_by_id!(id); end
end

class ActiveRecord::SchemaMigration < ActiveRecord::Base
  include ActiveRecord::SchemaMigration::GeneratedAttributeMethods
  extend ActiveRecord::SchemaMigration::CustomFinderMethods
  extend T::Sig
  extend T::Generic
  RelationType = T.type_alias { T.any(ActiveRecord::SchemaMigration::ActiveRecord_Relation, ActiveRecord::SchemaMigration::ActiveRecord_Associations_CollectionProxy, ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }

  sig { returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.all; end

  sig { params(block: T.nilable(T.proc.void)).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.unscoped(&block); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.select(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.order(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.reorder(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.group(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.limit(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.offset(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.left_joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.where(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.rewhere(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.preload(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.eager_load(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.includes(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.from(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.lock(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.readonly(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.or(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.having(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.create_with(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.distinct(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.references(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.none(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.unscope(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def self.extending(*args, &block); end
end

class ActiveRecord::SchemaMigration::ActiveRecord_Relation < ActiveRecord::Relation
  include ActiveRecord::SchemaMigration::ActiveRelation_WhereNot
  include ActiveRecord::SchemaMigration::CustomFinderMethods
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: ActiveRecord::SchemaMigration)

  sig { returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ActiveRecord::SchemaMigration::ActiveRecord_Relation) }
  def extending(*args, &block); end
end

class ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  include ActiveRecord::SchemaMigration::ActiveRelation_WhereNot
  include ActiveRecord::SchemaMigration::CustomFinderMethods
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: ActiveRecord::SchemaMigration)

  sig { returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end
end

class ActiveRecord::SchemaMigration::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  include ActiveRecord::SchemaMigration::CustomFinderMethods
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: ActiveRecord::SchemaMigration)

  sig { returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ActiveRecord::SchemaMigration::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end
end
