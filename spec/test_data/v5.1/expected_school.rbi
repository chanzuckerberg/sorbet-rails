# This is an autogenerated file for dynamic methods in School
# Please rerun bundle exec rake rails_rbi:models[School] to regenerate.

# typed: strong
module School::ActiveRelation_WhereNot
  sig { params(opts: T.untyped, rest: T.untyped).returns(T.self_type) }
  def not(opts, *rest); end
end

module School::GeneratedAttributeMethods
  extend T::Sig

  sig { returns(Integer) }
  def id; end

  sig { params(value: T.any(Numeric, ActiveSupport::Duration)).void }
  def id=(value); end

  sig { returns(T::Boolean) }
  def id?; end

  sig { returns(T.nilable(String)) }
  def name; end

  sig { params(value: T.nilable(T.any(String, Symbol))).void }
  def name=(value); end

  sig { returns(T::Boolean) }
  def name?; end
end

module School::GeneratedAssociationMethods
  extend T::Sig

  sig { returns(::Headmaster) }
  def headmaster; end

  sig { params(value: ::Headmaster).void }
  def headmaster=(value); end
end

module School::CustomFinderMethods
  sig { params(limit: Integer).returns(T::Array[School]) }
  def first_n(limit); end

  sig { params(limit: Integer).returns(T::Array[School]) }
  def last_n(limit); end

  sig { params(args: T::Array[T.any(Integer, String)]).returns(T::Array[School]) }
  def find_n(*args); end

  sig { params(id: Integer).returns(T.nilable(School)) }
  def find_by_id(id); end

  sig { params(id: Integer).returns(School) }
  def find_by_id!(id); end
end

class School < ApplicationRecord
  include School::GeneratedAttributeMethods
  include School::GeneratedAssociationMethods
  extend School::CustomFinderMethods
  extend T::Sig
  extend T::Generic
  RelationType = T.type_alias { T.any(School::ActiveRecord_Relation, School::ActiveRecord_Associations_CollectionProxy, School::ActiveRecord_AssociationRelation) }

  sig { returns(School::ActiveRecord_Relation) }
  def self.all; end

  sig { params(block: T.nilable(T.proc.void)).returns(School::ActiveRecord_Relation) }
  def self.unscoped(&block); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.select(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.order(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.reorder(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.group(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.limit(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.offset(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.joins(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.left_joins(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.where(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.rewhere(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.preload(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.eager_load(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.includes(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.from(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.lock(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.readonly(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.or(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.having(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.create_with(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.distinct(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.references(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.none(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.unscope(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.merge(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def self.except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(School::ActiveRecord_Relation) }
  def self.extending(*args, &block); end
end

class School::ActiveRecord_Relation < ActiveRecord::Relation
  include School::ActiveRelation_WhereNot
  include School::CustomFinderMethods
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: School)

  sig { returns(School::ActiveRecord_Relation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(School::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_Relation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(School::ActiveRecord_Relation) }
  def extending(*args, &block); end
end

class School::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  include School::ActiveRelation_WhereNot
  include School::CustomFinderMethods
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: School)

  sig { returns(School::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(School::ActiveRecord_AssociationRelation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(School::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end
end

class School::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  include School::CustomFinderMethods
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: School)

  sig { returns(School::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(School::ActiveRecord_AssociationRelation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(School::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(School::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end
end
