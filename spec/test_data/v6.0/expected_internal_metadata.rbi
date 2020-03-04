# This is an autogenerated file for dynamic methods in ActiveRecord::InternalMetadata
# Please rerun rake rails_rbi:models[ActiveRecord::InternalMetadata] to regenerate.

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

  sig { returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.all; end

  sig { params(block: T.nilable(T.proc.void)).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.unscoped(&block); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.select(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.reselect(*args); end

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
  def self.extract_associated(*args); end

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
  def self.optimizer_hints(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.merge(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.except(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def self.only(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
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
end

class ActiveRecord::InternalMetadata::ActiveRecord_Relation < ActiveRecord::Relation
  include ActiveRecord::InternalMetadata::ActiveRelation_WhereNot
  include ActiveRecord::InternalMetadata::CustomFinderMethods
  include Enumerable
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
  def reselect(*args); end

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
  def extract_associated(*args); end

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
  def optimizer_hints(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def except(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
  def only(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ActiveRecord::InternalMetadata::ActiveRecord_Relation) }
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
end

class ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  include ActiveRecord::InternalMetadata::ActiveRelation_WhereNot
  include ActiveRecord::InternalMetadata::CustomFinderMethods
  include Enumerable
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
  def reselect(*args); end

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
  def extract_associated(*args); end

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
  def optimizer_hints(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def only(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata) }
  def find(*args); end

  sig { params(args: T.untyped).returns(T.nilable(ActiveRecord::InternalMetadata)) }
  def find_by(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata) }
  def find_by!(*args); end

  sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ActiveRecord::InternalMetadata).void)).returns(ActiveRecord::InternalMetadata) }
  def find_or_initialize_by(attributes, &block); end

  sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ActiveRecord::InternalMetadata).void)).returns(ActiveRecord::InternalMetadata) }
  def find_or_create_by(attributes, &block); end

  sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ActiveRecord::InternalMetadata).void)).returns(ActiveRecord::InternalMetadata) }
  def find_or_create_by!(attributes, &block); end

  sig { returns(T.nilable(ActiveRecord::InternalMetadata)) }
  def first; end

  sig { returns(ActiveRecord::InternalMetadata) }
  def first!; end

  sig { returns(T.nilable(ActiveRecord::InternalMetadata)) }
  def second; end

  sig { returns(ActiveRecord::InternalMetadata) }
  def second!; end

  sig { returns(T.nilable(ActiveRecord::InternalMetadata)) }
  def third; end

  sig { returns(ActiveRecord::InternalMetadata) }
  def third!; end

  sig { returns(T.nilable(ActiveRecord::InternalMetadata)) }
  def third_to_last; end

  sig { returns(ActiveRecord::InternalMetadata) }
  def third_to_last!; end

  sig { returns(T.nilable(ActiveRecord::InternalMetadata)) }
  def second_to_last; end

  sig { returns(ActiveRecord::InternalMetadata) }
  def second_to_last!; end

  sig { returns(T.nilable(ActiveRecord::InternalMetadata)) }
  def last; end

  sig { returns(ActiveRecord::InternalMetadata) }
  def last!; end

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

  sig { override.params(block: T.proc.params(e: ActiveRecord::InternalMetadata).void).returns(T::Array[ActiveRecord::InternalMetadata]) }
  def each(&block); end

  sig { params(level: T.nilable(Integer)).returns(T::Array[ActiveRecord::InternalMetadata]) }
  def flatten(level); end

  sig { returns(T::Array[ActiveRecord::InternalMetadata]) }
  def to_a; end

  sig do
    type_parameters(:U).params(
        blk: T.proc.params(arg0: Elem).returns(T.type_parameter(:U)),
    )
    .returns(T::Array[T.type_parameter(:U)])
  end
  def map(&blk); end
end

class ActiveRecord::InternalMetadata::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  include ActiveRecord::InternalMetadata::CustomFinderMethods
  include Enumerable
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
  def reselect(*args); end

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
  def extract_associated(*args); end

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
  def optimizer_hints(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def only(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ActiveRecord::InternalMetadata::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata) }
  def find(*args); end

  sig { params(args: T.untyped).returns(T.nilable(ActiveRecord::InternalMetadata)) }
  def find_by(*args); end

  sig { params(args: T.untyped).returns(ActiveRecord::InternalMetadata) }
  def find_by!(*args); end

  sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ActiveRecord::InternalMetadata).void)).returns(ActiveRecord::InternalMetadata) }
  def find_or_initialize_by(attributes, &block); end

  sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ActiveRecord::InternalMetadata).void)).returns(ActiveRecord::InternalMetadata) }
  def find_or_create_by(attributes, &block); end

  sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ActiveRecord::InternalMetadata).void)).returns(ActiveRecord::InternalMetadata) }
  def find_or_create_by!(attributes, &block); end

  sig { returns(T.nilable(ActiveRecord::InternalMetadata)) }
  def first; end

  sig { returns(ActiveRecord::InternalMetadata) }
  def first!; end

  sig { returns(T.nilable(ActiveRecord::InternalMetadata)) }
  def second; end

  sig { returns(ActiveRecord::InternalMetadata) }
  def second!; end

  sig { returns(T.nilable(ActiveRecord::InternalMetadata)) }
  def third; end

  sig { returns(ActiveRecord::InternalMetadata) }
  def third!; end

  sig { returns(T.nilable(ActiveRecord::InternalMetadata)) }
  def third_to_last; end

  sig { returns(ActiveRecord::InternalMetadata) }
  def third_to_last!; end

  sig { returns(T.nilable(ActiveRecord::InternalMetadata)) }
  def second_to_last; end

  sig { returns(ActiveRecord::InternalMetadata) }
  def second_to_last!; end

  sig { returns(T.nilable(ActiveRecord::InternalMetadata)) }
  def last; end

  sig { returns(ActiveRecord::InternalMetadata) }
  def last!; end

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

  sig { override.params(block: T.proc.params(e: ActiveRecord::InternalMetadata).void).returns(T::Array[ActiveRecord::InternalMetadata]) }
  def each(&block); end

  sig { params(level: T.nilable(Integer)).returns(T::Array[ActiveRecord::InternalMetadata]) }
  def flatten(level); end

  sig { returns(T::Array[ActiveRecord::InternalMetadata]) }
  def to_a; end

  sig do
    type_parameters(:U).params(
        blk: T.proc.params(arg0: Elem).returns(T.type_parameter(:U)),
    )
    .returns(T::Array[T.type_parameter(:U)])
  end
  def map(&blk); end

  sig { params(records: T.any(ActiveRecord::InternalMetadata, T::Array[ActiveRecord::InternalMetadata])).returns(T.self_type) }
  def <<(*records); end

  sig { params(records: T.any(ActiveRecord::InternalMetadata, T::Array[ActiveRecord::InternalMetadata])).returns(T.self_type) }
  def append(*records); end

  sig { params(records: T.any(ActiveRecord::InternalMetadata, T::Array[ActiveRecord::InternalMetadata])).returns(T.self_type) }
  def push(*records); end

  sig { params(records: T.any(ActiveRecord::InternalMetadata, T::Array[ActiveRecord::InternalMetadata])).returns(T.self_type) }
  def concat(*records); end
end
