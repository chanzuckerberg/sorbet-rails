# This is an autogenerated file for dynamic methods in SpellBook
# Please rerun bundle exec rake rails_rbi:models[SpellBook] to regenerate.

# typed: strong
module SpellBook::EnumInstanceMethods
  extend T::Sig

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
  extend T::Sig

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

class SpellBook::BookType < T::Enum
  enums do
    Unclassified = new(%q{unclassified})
    Biology = new(%q{biology})
    DarkArt = new(%q{dark_art})
  end

end

module SpellBook::GeneratedAssociationMethods
  extend T::Sig

  sig { returns(::Spell::ActiveRecord_Associations_CollectionProxy) }
  def spells; end

  sig { returns(T::Array[Integer]) }
  def spell_ids; end

  sig { params(value: T::Enumerable[::Spell]).void }
  def spells=(value); end

  sig { returns(::Wizard) }
  def wizard; end

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
  extend T::Sig
  extend T::Generic
  RelationType = T.type_alias { T.any(SpellBook::ActiveRecord_Relation, SpellBook::ActiveRecord_Associations_CollectionProxy, SpellBook::ActiveRecord_AssociationRelation) }

  sig { returns(T::Hash[T.any(String, Symbol), Integer]) }
  def self.book_types; end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.biology(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.dark_art(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.not_biology(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.not_dark_art(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.not_unclassified(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.unclassified(*args); end

  sig { returns(SpellBook::ActiveRecord_Relation) }
  def self.all; end

  sig { params(block: T.nilable(T.proc.void)).returns(SpellBook::ActiveRecord_Relation) }
  def self.unscoped(&block); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.select(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.reselect(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.order(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.reorder(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.group(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.limit(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.offset(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.joins(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.left_joins(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.where(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.rewhere(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.preload(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.extract_associated(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.eager_load(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.includes(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.from(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.lock(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.readonly(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.or(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.having(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.create_with(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.distinct(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.references(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.none(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.unscope(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.optimizer_hints(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.merge(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.except(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def self.only(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(SpellBook::ActiveRecord_Relation) }
  def self.extending(*args, &block); end

  sig { returns(SpellBook::BookType) }
  def typed_book_type; end

  sig { params(value: SpellBook::BookType).void }
  def typed_book_type=(value); end
end

class SpellBook::ActiveRecord_Relation < ActiveRecord::Relation
  include SpellBook::ActiveRelation_WhereNot
  include SpellBook::CustomFinderMethods
  include Enumerable
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: SpellBook)

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def biology(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def dark_art(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def not_biology(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def not_dark_art(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def not_unclassified(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def unclassified(*args); end

  sig { returns(SpellBook::ActiveRecord_Relation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(SpellBook::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def reselect(*args); end

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
  def extract_associated(*args); end

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
  def optimizer_hints(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def except(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_Relation) }
  def only(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(SpellBook::ActiveRecord_Relation) }
  def extending(*args, &block); end
end

class SpellBook::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  include SpellBook::ActiveRelation_WhereNot
  include SpellBook::CustomFinderMethods
  include Enumerable
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: SpellBook)

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def biology(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def dark_art(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def not_biology(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def not_dark_art(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def not_unclassified(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def unclassified(*args); end

  sig { returns(SpellBook::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def reselect(*args); end

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
  def extract_associated(*args); end

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
  def optimizer_hints(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def only(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end

  sig { override.params(block: T.proc.params(e: SpellBook).void).returns(T::Array[SpellBook]) }
  def each(&block); end

  sig { params(level: T.nilable(Integer)).returns(T::Array[SpellBook]) }
  def flatten(level); end

  sig { returns(T::Array[SpellBook]) }
  def to_a; end

  sig do
    type_parameters(:U).params(
        blk: T.proc.params(arg0: Elem).returns(T.type_parameter(:U)),
    )
    .returns(T::Array[T.type_parameter(:U)])
  end
  def map(&blk); end
end

class SpellBook::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  include SpellBook::CustomFinderMethods
  include Enumerable
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: SpellBook)

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def biology(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def dark_art(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def not_biology(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def not_dark_art(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def not_unclassified(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def unclassified(*args); end

  sig { returns(SpellBook::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def select(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def reselect(*args); end

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
  def extract_associated(*args); end

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
  def optimizer_hints(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def only(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(SpellBook::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end

  sig { override.params(block: T.proc.params(e: SpellBook).void).returns(T::Array[SpellBook]) }
  def each(&block); end

  sig { params(level: T.nilable(Integer)).returns(T::Array[SpellBook]) }
  def flatten(level); end

  sig { returns(T::Array[SpellBook]) }
  def to_a; end

  sig do
    type_parameters(:U).params(
        blk: T.proc.params(arg0: Elem).returns(T.type_parameter(:U)),
    )
    .returns(T::Array[T.type_parameter(:U)])
  end
  def map(&blk); end

  sig { params(records: T.any(SpellBook, T::Array[SpellBook])).returns(T.self_type) }
  def <<(*records); end

  sig { params(records: T.any(SpellBook, T::Array[SpellBook])).returns(T.self_type) }
  def append(*records); end

  sig { params(records: T.any(SpellBook, T::Array[SpellBook])).returns(T.self_type) }
  def push(*records); end

  sig { params(records: T.any(SpellBook, T::Array[SpellBook])).returns(T.self_type) }
  def concat(*records); end
end
