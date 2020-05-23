# This is an autogenerated file for dynamic methods in Spell
# Please rerun bundle exec rake rails_rbi:models[Spell] to regenerate.

# typed: strong
module Spell::ActiveRelation_WhereNot
  sig { params(opts: T.untyped, rest: T.untyped).returns(T.self_type) }
  def not(opts, *rest); end
end

module Spell::GeneratedAttributeMethods
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

module Spell::GeneratedAssociationMethods
  sig { returns(::SpellBook::ActiveRecord_Associations_CollectionProxy) }
  def spell_books; end

  sig { returns(T::Array[Integer]) }
  def spell_book_ids; end

  sig { params(value: T::Enumerable[::SpellBook]).void }
  def spell_books=(value); end
end

module Spell::CustomFinderMethods
  sig { params(limit: Integer).returns(T::Array[Spell]) }
  def first_n(limit); end

  sig { params(limit: Integer).returns(T::Array[Spell]) }
  def last_n(limit); end

  sig { params(args: T::Array[T.any(Integer, String)]).returns(T::Array[Spell]) }
  def find_n(*args); end

  sig { params(id: Integer).returns(T.nilable(Spell)) }
  def find_by_id(id); end

  sig { params(id: Integer).returns(Spell) }
  def find_by_id!(id); end
end

class Spell < ApplicationRecord
  include Spell::GeneratedAttributeMethods
  include Spell::GeneratedAssociationMethods
  extend Spell::CustomFinderMethods
  extend Spell::QueryMethodsReturningRelation
  RelationType = T.type_alias { T.any(Spell::ActiveRecord_Relation, Spell::ActiveRecord_Associations_CollectionProxy, Spell::ActiveRecord_AssociationRelation) }
end

module Spell::QueryMethodsReturningRelation
  sig { returns(Spell::ActiveRecord_Relation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Spell::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def reselect(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def extract_associated(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def optimizer_hints(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def except(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_Relation) }
  def only(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Spell::ActiveRecord_Relation) }
  def extending(*args, &block); end

  sig do
    params(
      of: T.nilable(Integer),
      start: T.nilable(Integer),
      finish: T.nilable(Integer),
      load: T.nilable(T::Boolean),
      error_on_ignore: T.nilable(T::Boolean),
      block: T.nilable(T.proc.params(e: Spell::ActiveRecord_Relation).void)
    ).returns(ActiveRecord::Batches::BatchEnumerator)
  end
  def in_batches(of: 1000, start: nil, finish: nil, load: false, error_on_ignore: nil, &block); end
end

module Spell::QueryMethodsReturningAssociationRelation
  sig { returns(Spell::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Spell::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def reselect(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def extract_associated(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def optimizer_hints(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped).returns(Spell::ActiveRecord_AssociationRelation) }
  def only(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Spell::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end

  sig do
    params(
      of: T.nilable(Integer),
      start: T.nilable(Integer),
      finish: T.nilable(Integer),
      load: T.nilable(T::Boolean),
      error_on_ignore: T.nilable(T::Boolean),
      block: T.nilable(T.proc.params(e: Spell::ActiveRecord_AssociationRelation).void)
    ).returns(ActiveRecord::Batches::BatchEnumerator)
  end
  def in_batches(of: 1000, start: nil, finish: nil, load: false, error_on_ignore: nil, &block); end
end

class Spell::ActiveRecord_Relation < ActiveRecord::Relation
  include Spell::ActiveRelation_WhereNot
  include Spell::CustomFinderMethods
  include Spell::QueryMethodsReturningRelation
  Elem = type_member(fixed: Spell)
end

class Spell::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  include Spell::ActiveRelation_WhereNot
  include Spell::CustomFinderMethods
  include Spell::QueryMethodsReturningAssociationRelation
  Elem = type_member(fixed: Spell)
end

class Spell::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  include Spell::CustomFinderMethods
  include Spell::QueryMethodsReturningAssociationRelation
  Elem = type_member(fixed: Spell)

  sig { params(records: T.any(Spell, T::Array[Spell])).returns(T.self_type) }
  def <<(*records); end

  sig { params(records: T.any(Spell, T::Array[Spell])).returns(T.self_type) }
  def append(*records); end

  sig { params(records: T.any(Spell, T::Array[Spell])).returns(T.self_type) }
  def push(*records); end

  sig { params(records: T.any(Spell, T::Array[Spell])).returns(T.self_type) }
  def concat(*records); end
end
