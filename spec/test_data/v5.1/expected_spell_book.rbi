# This is an autogenerated file for dynamic methods in SpellBook
# Please rerun bundle exec rake rails_rbi:models[SpellBook] to regenerate.

# typed: strong
module SpellBook::EnumInstanceMethods
  sig { returns(T::Boolean) }
  def unclassified?; end

  sig { void }
  def unclassified!; end

  sig { returns(T::Boolean) }
  def biology?; end

  sig { void }
  def biology!; end

  sig { returns(T::Boolean) }
  def dark_art?; end

  sig { void }
  def dark_art!; end
end

module SpellBook::ActiveRelation_WhereNot
  sig { params(opts: T.untyped, rest: T.untyped).returns(T.self_type) }
  def not(opts, *rest); end
end

module SpellBook::GeneratedAttributeMethods
  sig { returns(String) }
  def book_type; end

  sig { params(value: T.any(Integer, String, Symbol)).void }
  def book_type=(value); end

  sig { returns(T::Boolean) }
  def book_type?; end

  sig { returns(Integer) }
  def id; end

  sig { params(value: T.any(Numeric, ActiveSupport::Duration)).void }
  def id=(value); end

  sig { returns(T::Boolean) }
  def id?; end

  sig { returns(String) }
  def name; end

  sig { params(value: T.any(String, Symbol)).void }
  def name=(value); end

  sig { returns(T::Boolean) }
  def name?; end

  sig { returns(Integer) }
  def wizard_id; end

  sig { params(value: T.any(Numeric, ActiveSupport::Duration)).void }
  def wizard_id=(value); end

  sig { returns(T::Boolean) }
  def wizard_id?; end
end

module SpellBook::GeneratedAssociationMethods
  sig { returns(::Spell::ActiveRecord_Associations_CollectionProxy) }
  def spells; end

  sig { returns(T::Array[Integer]) }
  def spell_ids; end

  sig { params(value: T::Enumerable[::Spell]).void }
  def spells=(value); end

  sig { returns(::Wizard) }
  def wizard; end

  sig { params(args: T.untyped, block: T.nilable(T.proc.params(object: ::Wizard).void)).returns(::Wizard) }
  def build_wizard(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.params(object: ::Wizard).void)).returns(::Wizard) }
  def create_wizard(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.params(object: ::Wizard).void)).returns(::Wizard) }
  def create_wizard!(*args, &block); end

  sig { params(value: ::Wizard).void }
  def wizard=(value); end
end

module SpellBook::CustomFinderMethods
  sig { params(limit: Integer).returns(T::Array[SpellBook]) }
  def first_n(limit); end

  sig { params(limit: Integer).returns(T::Array[SpellBook]) }
  def last_n(limit); end

  sig { params(args: T::Array[T.any(Integer, String)]).returns(T::Array[SpellBook]) }
  def find_n(*args); end

  sig { params(id: Integer).returns(T.nilable(SpellBook)) }
  def find_by_id(id); end

  sig { params(id: Integer).returns(SpellBook) }
  def find_by_id!(id); end
end

class SpellBook < ApplicationRecord
  include SpellBook::EnumInstanceMethods
  include SpellBook::GeneratedAttributeMethods
  include SpellBook::GeneratedAssociationMethods
  extend SpellBook::CustomFinderMethods
  extend SpellBook::QueryMethodsReturningRelation
  RelationType = T.type_alias { T.any(SpellBook::ActiveRecord_Relation, SpellBook::ActiveRecord_Associations_CollectionProxy, SpellBook::ActiveRecord_AssociationRelation) }

  sig { returns(T::Hash[T.any(String, Symbol), Integer]) }
  def self.book_types; end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.biology(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.dark_art(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.recent(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.unclassified(*args); end

  sig { returns(SpellBook::BookType) }
  def typed_book_type; end

  sig { params(value: SpellBook::BookType).void }
  def typed_book_type=(value); end

  class BookType < T::Enum
    enums do
      Unclassified = new(%q{unclassified})
      Biology = new(%q{biology})
      DarkArt = new(%q{dark_art})
    end

  end
end

class SpellBook::ActiveRecord_Relation < ActiveRecord::Relation
  include SpellBook::ActiveRelation_WhereNot
  include SpellBook::CustomFinderMethods
  include SpellBook::QueryMethodsReturningRelation
  Elem = type_member(fixed: SpellBook)

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def biology(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def dark_art(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def recent(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def unclassified(*args); end
end

class SpellBook::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  include SpellBook::ActiveRelation_WhereNot
  include SpellBook::CustomFinderMethods
  include SpellBook::QueryMethodsReturningAssociationRelation
  Elem = type_member(fixed: SpellBook)

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def biology(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def dark_art(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def recent(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def unclassified(*args); end
end

class SpellBook::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  include SpellBook::CustomFinderMethods
  include SpellBook::QueryMethodsReturningAssociationRelation
  Elem = type_member(fixed: SpellBook)

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def biology(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def dark_art(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def recent(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def unclassified(*args); end

  sig { params(records: T.any(SpellBook, T::Array[SpellBook])).returns(T.self_type) }
  def <<(*records); end

  sig { params(records: T.any(SpellBook, T::Array[SpellBook])).returns(T.self_type) }
  def append(*records); end

  sig { params(records: T.any(SpellBook, T::Array[SpellBook])).returns(T.self_type) }
  def push(*records); end

  sig { params(records: T.any(SpellBook, T::Array[SpellBook])).returns(T.self_type) }
  def concat(*records); end
end

module SpellBook::QueryMethodsReturningRelation
  sig { returns(SpellBook::ActiveRecord_Relation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(SpellBook::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(SpellBook::ActiveRecord_Relation) }
  def extending(*args, &block); end

  sig do
    params(
      of: T.nilable(Integer),
      start: T.nilable(Integer),
      finish: T.nilable(Integer),
      load: T.nilable(T::Boolean),
      error_on_ignore: T.nilable(T::Boolean),
      block: T.nilable(T.proc.params(e: SpellBook::ActiveRecord_Relation).void)
    ).returns(ActiveRecord::Batches::BatchEnumerator)
  end
  def in_batches(of: 1000, start: nil, finish: nil, load: false, error_on_ignore: nil, &block); end
end

module SpellBook::QueryMethodsReturningAssociationRelation
  sig { returns(SpellBook::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(SpellBook::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end

  sig do
    params(
      of: T.nilable(Integer),
      start: T.nilable(Integer),
      finish: T.nilable(Integer),
      load: T.nilable(T::Boolean),
      error_on_ignore: T.nilable(T::Boolean),
      block: T.nilable(T.proc.params(e: SpellBook::ActiveRecord_AssociationRelation).void)
    ).returns(ActiveRecord::Batches::BatchEnumerator)
  end
  def in_batches(of: 1000, start: nil, finish: nil, load: false, error_on_ignore: nil, &block); end
end
