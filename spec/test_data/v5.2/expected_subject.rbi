# This is an autogenerated file for dynamic methods in Subject
# Please rerun bundle exec rake rails_rbi:models[Subject] to regenerate.

# typed: strong
module Subject::ActiveRelation_WhereNot
  sig { params(opts: T.untyped, rest: T.untyped).returns(T.self_type) }
  def not(opts, *rest); end
end

module Subject::GeneratedAttributeMethods
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

module Subject::GeneratedAssociationMethods
  extend T::Sig

  sig { returns(::Wizard::ActiveRecord_Associations_CollectionProxy) }
  def wizards; end

  sig { returns(T::Array[Integer]) }
  def wizard_ids; end

  sig { params(value: T::Enumerable[::Wizard]).void }
  def wizards=(value); end
end

module Subject::CustomFinderMethods
  sig { params(limit: Integer).returns(T::Array[Subject]) }
  def first_n(limit); end

  sig { params(limit: Integer).returns(T::Array[Subject]) }
  def last_n(limit); end

  sig { params(args: T::Array[T.any(Integer, String)]).returns(T::Array[Subject]) }
  def find_n(*args); end

  sig { params(id: Integer).returns(T.nilable(Subject)) }
  def find_by_id(id); end

  sig { params(id: Integer).returns(Subject) }
  def find_by_id!(id); end
end

class Subject < ApplicationRecord
  include Subject::GeneratedAttributeMethods
  include Subject::GeneratedAssociationMethods
  extend Subject::CustomFinderMethods
  extend Subject::QueryMethodsReturningRelation
  extend T::Sig
  extend T::Generic
  RelationType = T.type_alias { T.any(Subject::ActiveRecord_Relation, Subject::ActiveRecord_Associations_CollectionProxy, Subject::ActiveRecord_AssociationRelation) }
end

module Subject::QueryMethodsReturningRelation
  sig { returns(Subject::ActiveRecord_Relation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Subject::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_Relation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Subject::ActiveRecord_Relation) }
  def extending(*args, &block); end
end

module Subject::QueryMethodsReturningAssociationRelation
  sig { returns(Subject::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Subject::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(Subject::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Subject::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end
end

class Subject::ActiveRecord_Relation < ActiveRecord::Relation
  include Subject::ActiveRelation_WhereNot
  include Subject::CustomFinderMethods
  include Subject::QueryMethodsReturningRelation
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: Subject)
end

class Subject::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  include Subject::ActiveRelation_WhereNot
  include Subject::CustomFinderMethods
  include Subject::QueryMethodsReturningAssociationRelation
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: Subject)
end

class Subject::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  include Subject::CustomFinderMethods
  include Subject::QueryMethodsReturningAssociationRelation
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: Subject)

  sig { params(records: T.any(Subject, T::Array[Subject])).returns(T.self_type) }
  def <<(*records); end

  sig { params(records: T.any(Subject, T::Array[Subject])).returns(T.self_type) }
  def append(*records); end

  sig { params(records: T.any(Subject, T::Array[Subject])).returns(T.self_type) }
  def push(*records); end

  sig { params(records: T.any(Subject, T::Array[Subject])).returns(T.self_type) }
  def concat(*records); end
end
