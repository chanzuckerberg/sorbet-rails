# This is an autogenerated file for dynamic methods in Potion
# Please rerun bundle exec rake rails_rbi:models[Potion] to regenerate.

# typed: strong
module Potion::ActiveRelation_WhereNot
  sig { params(opts: T.untyped, rest: T.untyped).returns(T.self_type) }
  def not(opts, *rest); end
end

module Potion::GeneratedAssociationMethods
  extend T::Sig

  sig { returns(T.nilable(::Wizard)) }
  def wizard; end

  sig { params(value: T.nilable(::Wizard)).void }
  def wizard=(value); end
end

module Potion::CustomFinderMethods
  sig { params(limit: Integer).returns(T::Array[Potion]) }
  def first_n(limit); end

  sig { params(limit: Integer).returns(T::Array[Potion]) }
  def last_n(limit); end

  sig { params(args: T::Array[T.any(Integer, String)]).returns(T::Array[Potion]) }
  def find_n(*args); end

  sig { params(id: Integer).returns(T.nilable(Potion)) }
  def find_by_id(id); end

  sig { params(id: Integer).returns(Potion) }
  def find_by_id!(id); end
end

class Potion < ApplicationRecord
  include Potion::GeneratedAssociationMethods
  extend Potion::CustomFinderMethods
  extend T::Sig
  extend T::Generic
  RelationType = T.type_alias { T.any(Potion::ActiveRecord_Relation, Potion::ActiveRecord_Associations_CollectionProxy, Potion::ActiveRecord_AssociationRelation) }

  sig { returns(Potion::ActiveRecord_Relation) }
  def self.all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Potion::ActiveRecord_Relation) }
  def self.unscoped(&block); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.select(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.order(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.reorder(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.group(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.limit(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.offset(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.joins(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.left_joins(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.where(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.rewhere(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.preload(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.eager_load(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.includes(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.from(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.lock(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.readonly(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.or(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.having(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.create_with(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.distinct(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.references(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.none(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.unscope(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def self.except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Potion::ActiveRecord_Relation) }
  def self.extending(*args, &block); end

  sig { params(conditions: T.untyped).returns(T::Boolean) }
  def self.exists?(conditions = nil); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def self.any?(*args); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def self.many?(*args); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def self.none?(*args); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def self.one?(*args); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def self.empty?(*args); end
end

class Potion::ActiveRecord_Relation < ActiveRecord::Relation
  include Potion::ActiveRelation_WhereNot
  include Potion::CustomFinderMethods
  include Enumerable
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: Potion)

  sig { returns(Potion::ActiveRecord_Relation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Potion::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_Relation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Potion::ActiveRecord_Relation) }
  def extending(*args, &block); end

  sig { params(conditions: T.untyped).returns(T::Boolean) }
  def exists?(conditions = nil); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def any?(*args); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def many?(*args); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def none?(*args); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def one?(*args); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def empty?(*args); end
end

class Potion::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  include Potion::ActiveRelation_WhereNot
  include Potion::CustomFinderMethods
  include Enumerable
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: Potion)

  sig { returns(Potion::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Potion::ActiveRecord_AssociationRelation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Potion::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end

  sig { params(conditions: T.untyped).returns(T::Boolean) }
  def exists?(conditions = nil); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def any?(*args); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def many?(*args); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def none?(*args); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def one?(*args); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def empty?(*args); end

  sig { override.params(block: T.proc.params(e: Potion).void).returns(T::Array[Potion]) }
  def each(&block); end

  sig { params(level: T.nilable(Integer)).returns(T::Array[Potion]) }
  def flatten(level); end

  sig { returns(T::Array[Potion]) }
  def to_a; end

  sig do
    type_parameters(:U).params(
        blk: T.proc.params(arg0: Elem).returns(T.type_parameter(:U)),
    )
    .returns(T::Array[T.type_parameter(:U)])
  end
  def map(&blk); end
end

class Potion::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  include Potion::CustomFinderMethods
  include Enumerable
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: Potion)

  sig { returns(Potion::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Potion::ActiveRecord_AssociationRelation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(Potion::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Potion::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end

  sig { params(conditions: T.untyped).returns(T::Boolean) }
  def exists?(conditions = nil); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def any?(*args); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def many?(*args); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def none?(*args); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def one?(*args); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def empty?(*args); end

  sig { override.params(block: T.proc.params(e: Potion).void).returns(T::Array[Potion]) }
  def each(&block); end

  sig { params(level: T.nilable(Integer)).returns(T::Array[Potion]) }
  def flatten(level); end

  sig { returns(T::Array[Potion]) }
  def to_a; end

  sig do
    type_parameters(:U).params(
        blk: T.proc.params(arg0: Elem).returns(T.type_parameter(:U)),
    )
    .returns(T::Array[T.type_parameter(:U)])
  end
  def map(&blk); end

  sig { params(records: T.any(Potion, T::Array[Potion])).returns(T.self_type) }
  def <<(*records); end

  sig { params(records: T.any(Potion, T::Array[Potion])).returns(T.self_type) }
  def append(*records); end

  sig { params(records: T.any(Potion, T::Array[Potion])).returns(T.self_type) }
  def push(*records); end

  sig { params(records: T.any(Potion, T::Array[Potion])).returns(T.self_type) }
  def concat(*records); end
end
