# This is an autogenerated file for dynamic methods in Wizard
# Please rerun rake rails_rbi:models[Wizard] to regenerate.

# typed: strong
module Wizard::EnumInstanceMethods
  extend T::Sig

  sig { returns(T::Boolean) }
  def Gryffindor?; end

  sig { void }
  def Gryffindor!; end

  sig { returns(T::Boolean) }
  def Hufflepuff?; end

  sig { void }
  def Hufflepuff!; end

  sig { returns(T::Boolean) }
  def Ravenclaw?; end

  sig { void }
  def Ravenclaw!; end

  sig { returns(T::Boolean) }
  def Slytherin?; end

  sig { void }
  def Slytherin!; end
end

module Wizard::ActiveRelation_WhereNot
  sig { params(opts: T.untyped, rest: T.untyped).returns(T.self_type) }
  def not(opts, *rest); end
end

module Wizard::GeneratedAttributeMethods
  extend T::Sig

  sig { returns(DateTime) }
  def created_at; end

  sig { params(value: DateTime).void }
  def created_at=(value); end

  sig { returns(T::Boolean) }
  def created_at?; end

  sig { returns(T.nilable(String)) }
  def house; end

  sig { params(value: T.nilable(T.any(Integer, String, Symbol))).void }
  def house=(value); end

  sig { returns(T::Boolean) }
  def house?; end

  sig { returns(Integer) }
  def id; end

  sig { params(value: Integer).void }
  def id=(value); end

  sig { returns(T::Boolean) }
  def id?; end

  sig { returns(T.nilable(String)) }
  def name; end

  sig { params(value: T.nilable(String)).void }
  def name=(value); end

  sig { returns(T::Boolean) }
  def name?; end

  sig { returns(T.nilable(String)) }
  def notes; end

  sig { params(value: T.nilable(String)).void }
  def notes=(value); end

  sig { returns(T::Boolean) }
  def notes?; end

  sig { returns(T.nilable(String)) }
  def parent_email; end

  sig { params(value: T.nilable(String)).void }
  def parent_email=(value); end

  sig { returns(T::Boolean) }
  def parent_email?; end

  sig { returns(DateTime) }
  def updated_at; end

  sig { params(value: DateTime).void }
  def updated_at=(value); end

  sig { returns(T::Boolean) }
  def updated_at?; end
end

module Wizard::GeneratedAssociationMethods
  extend T::Sig

  sig { returns(ActiveRecord::Associations::CollectionProxy) }
  def spell_books; end

  sig { params(value: T.any(T::Array[T.untyped], ActiveRecord::Associations::CollectionProxy)).void }
  def spell_books=(value); end

  sig { returns(T.nilable(::Wand)) }
  def wand; end

  sig { params(value: T.nilable(::Wand)).void }
  def wand=(value); end
end

module Wizard::CustomFinderMethods
  sig { params(limit: Integer).returns(T::Array[Wizard]) }
  def first_n(limit); end

  sig { params(limit: Integer).returns(T::Array[Wizard]) }
  def last_n(limit); end

  sig { params(args: T::Array[T.any(Integer, String)]).returns(T::Array[Wizard]) }
  def find_n(*args); end

  sig { params(id: Integer).returns(T.nilable(Wizard)) }
  def find_by_id(id); end

  sig { params(id: Integer).returns(Wizard) }
  def find_by_id!(id); end
end

class Wizard < ApplicationRecord
  include Wizard::EnumInstanceMethods
  include Wizard::GeneratedAttributeMethods
  include Wizard::GeneratedAssociationMethods
  extend Wizard::CustomFinderMethods
  extend T::Sig
  extend T::Generic

  sig { returns(T::Hash[T.any(String, Symbol), Integer]) }
  def self.houses; end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def self.Gryffindor(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def self.Hufflepuff(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def self.Ravenclaw(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def self.Slytherin(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def self.not_Gryffindor(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def self.not_Hufflepuff(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def self.not_Ravenclaw(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def self.not_Slytherin(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def self.recent(*args); end

  sig { returns(Wizard::ActiveRecord_Relation) }
  def self.all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.unscoped(&block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.select(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.reselect(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.order(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.reorder(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.group(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.limit(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.offset(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.joins(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.left_joins(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.left_outer_joins(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.where(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.rewhere(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.preload(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.extract_associated(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.eager_load(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.includes(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.from(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.lock(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.readonly(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.extending(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.or(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.having(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.create_with(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.distinct(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.references(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.none(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.unscope(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.optimizer_hints(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.merge(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.except(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def self.only(*args, &block); end

  sig { params(args: T.untyped).returns(Wizard) }
  def self.find(*args); end

  sig { params(args: T.untyped).returns(T.nilable(Wizard)) }
  def self.find_by(*args); end

  sig { params(args: T.untyped).returns(Wizard) }
  def self.find_by!(*args); end

  sig { returns(T.nilable(Wizard)) }
  def self.first; end

  sig { returns(Wizard) }
  def self.first!; end

  sig { returns(T.nilable(Wizard)) }
  def self.second; end

  sig { returns(Wizard) }
  def self.second!; end

  sig { returns(T.nilable(Wizard)) }
  def self.third; end

  sig { returns(Wizard) }
  def self.third!; end

  sig { returns(T.nilable(Wizard)) }
  def self.third_to_last; end

  sig { returns(Wizard) }
  def self.third_to_last!; end

  sig { returns(T.nilable(Wizard)) }
  def self.second_to_last; end

  sig { returns(Wizard) }
  def self.second_to_last!; end

  sig { returns(T.nilable(Wizard)) }
  def self.last; end

  sig { returns(Wizard) }
  def self.last!; end

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

class Wizard::ActiveRecord_Relation < ActiveRecord::Relation
  include Wizard::ActiveRelation_WhereNot
  include Wizard::CustomFinderMethods
  include Enumerable
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: Wizard)

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def Gryffindor(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def Hufflepuff(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def Ravenclaw(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def Slytherin(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def not_Gryffindor(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def not_Hufflepuff(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def not_Ravenclaw(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def not_Slytherin(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def recent(*args); end

  sig { returns(Wizard::ActiveRecord_Relation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def select(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def reselect(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def order(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def reorder(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def group(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def limit(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def offset(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def joins(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def left_joins(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def left_outer_joins(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def where(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def rewhere(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def preload(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def extract_associated(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def eager_load(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def includes(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def from(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def lock(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def readonly(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def extending(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def or(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def having(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def create_with(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def distinct(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def references(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def none(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def unscope(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def optimizer_hints(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def merge(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def except(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def only(*args, &block); end

  sig { params(args: T.untyped).returns(Wizard) }
  def find(*args); end

  sig { params(args: T.untyped).returns(T.nilable(Wizard)) }
  def find_by(*args); end

  sig { params(args: T.untyped).returns(Wizard) }
  def find_by!(*args); end

  sig { returns(T.nilable(Wizard)) }
  def first; end

  sig { returns(Wizard) }
  def first!; end

  sig { returns(T.nilable(Wizard)) }
  def second; end

  sig { returns(Wizard) }
  def second!; end

  sig { returns(T.nilable(Wizard)) }
  def third; end

  sig { returns(Wizard) }
  def third!; end

  sig { returns(T.nilable(Wizard)) }
  def third_to_last; end

  sig { returns(Wizard) }
  def third_to_last!; end

  sig { returns(T.nilable(Wizard)) }
  def second_to_last; end

  sig { returns(Wizard) }
  def second_to_last!; end

  sig { returns(T.nilable(Wizard)) }
  def last; end

  sig { returns(Wizard) }
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

  sig { implementation.params(block: T.proc.params(e: Wizard).void).void }
  def each(&block); end

  sig { params(level: T.nilable(Integer)).returns(T::Array[Wizard]) }
  def flatten(level); end

  sig { returns(T::Array[Wizard]) }
  def to_a; end

  sig do
    type_parameters(:U).params(
        blk: T.proc.params(arg0: Elem).returns(T.type_parameter(:U)),
    )
    .returns(T::Array[T.type_parameter(:U)])
  end
  def map(&blk); end
end

class Wizard::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  include Wizard::ActiveRelation_WhereNot
  include Wizard::CustomFinderMethods
  include Enumerable
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: Wizard)

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def Gryffindor(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def Hufflepuff(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def Ravenclaw(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def Slytherin(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def not_Gryffindor(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def not_Hufflepuff(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def not_Ravenclaw(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def not_Slytherin(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def recent(*args); end

  sig { returns(Wizard::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def unscoped(&block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def select(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def reselect(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def order(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def reorder(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def group(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def limit(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def offset(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def joins(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def left_joins(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def left_outer_joins(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def where(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def rewhere(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def preload(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def extract_associated(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def eager_load(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def includes(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def from(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def lock(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def readonly(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def or(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def having(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def create_with(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def distinct(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def references(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def none(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def unscope(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def optimizer_hints(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def merge(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def except(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def only(*args, &block); end

  sig { params(args: T.untyped).returns(Wizard) }
  def find(*args); end

  sig { params(args: T.untyped).returns(T.nilable(Wizard)) }
  def find_by(*args); end

  sig { params(args: T.untyped).returns(Wizard) }
  def find_by!(*args); end

  sig { returns(T.nilable(Wizard)) }
  def first; end

  sig { returns(Wizard) }
  def first!; end

  sig { returns(T.nilable(Wizard)) }
  def second; end

  sig { returns(Wizard) }
  def second!; end

  sig { returns(T.nilable(Wizard)) }
  def third; end

  sig { returns(Wizard) }
  def third!; end

  sig { returns(T.nilable(Wizard)) }
  def third_to_last; end

  sig { returns(Wizard) }
  def third_to_last!; end

  sig { returns(T.nilable(Wizard)) }
  def second_to_last; end

  sig { returns(Wizard) }
  def second_to_last!; end

  sig { returns(T.nilable(Wizard)) }
  def last; end

  sig { returns(Wizard) }
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

  sig { implementation.params(block: T.proc.params(e: Wizard).void).void }
  def each(&block); end

  sig { params(level: T.nilable(Integer)).returns(T::Array[Wizard]) }
  def flatten(level); end

  sig { returns(T::Array[Wizard]) }
  def to_a; end

  sig do
    type_parameters(:U).params(
        blk: T.proc.params(arg0: Elem).returns(T.type_parameter(:U)),
    )
    .returns(T::Array[T.type_parameter(:U)])
  end
  def map(&blk); end
end

class Wizard::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  include Wizard::CustomFinderMethods
  include Enumerable
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: Wizard)

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def Gryffindor(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def Hufflepuff(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def Ravenclaw(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def Slytherin(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def not_Gryffindor(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def not_Hufflepuff(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def not_Ravenclaw(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def not_Slytherin(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_AssociationRelation) }
  def recent(*args); end

  sig { returns(Wizard::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def unscoped(&block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def select(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def reselect(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def order(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def reorder(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def group(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def limit(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def offset(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def joins(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def left_joins(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def left_outer_joins(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def where(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def rewhere(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def preload(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def extract_associated(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def eager_load(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def includes(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def from(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def lock(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def readonly(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def or(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def having(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def create_with(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def distinct(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def references(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def none(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def unscope(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def optimizer_hints(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def merge(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def except(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_AssociationRelation) }
  def only(*args, &block); end

  sig { params(args: T.untyped).returns(Wizard) }
  def find(*args); end

  sig { params(args: T.untyped).returns(T.nilable(Wizard)) }
  def find_by(*args); end

  sig { params(args: T.untyped).returns(Wizard) }
  def find_by!(*args); end

  sig { returns(T.nilable(Wizard)) }
  def first; end

  sig { returns(Wizard) }
  def first!; end

  sig { returns(T.nilable(Wizard)) }
  def second; end

  sig { returns(Wizard) }
  def second!; end

  sig { returns(T.nilable(Wizard)) }
  def third; end

  sig { returns(Wizard) }
  def third!; end

  sig { returns(T.nilable(Wizard)) }
  def third_to_last; end

  sig { returns(Wizard) }
  def third_to_last!; end

  sig { returns(T.nilable(Wizard)) }
  def second_to_last; end

  sig { returns(Wizard) }
  def second_to_last!; end

  sig { returns(T.nilable(Wizard)) }
  def last; end

  sig { returns(Wizard) }
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

  sig { implementation.params(block: T.proc.params(e: Wizard).void).void }
  def each(&block); end

  sig { params(level: T.nilable(Integer)).returns(T::Array[Wizard]) }
  def flatten(level); end

  sig { returns(T::Array[Wizard]) }
  def to_a; end

  sig do
    type_parameters(:U).params(
        blk: T.proc.params(arg0: Elem).returns(T.type_parameter(:U)),
    )
    .returns(T::Array[T.type_parameter(:U)])
  end
  def map(&blk); end

  sig { params(records: T.any(Wizard, T::Array[Wizard])).returns(T.self_type) }
  def <<(*records); end

  sig { params(records: T.any(Wizard, T::Array[Wizard])).returns(T.self_type) }
  def append(*records); end

  sig { params(records: T.any(Wizard, T::Array[Wizard])).returns(T.self_type) }
  def push(*records); end

  sig { params(records: T.any(Wizard, T::Array[Wizard])).returns(T.self_type) }
  def concat(*records); end
end
