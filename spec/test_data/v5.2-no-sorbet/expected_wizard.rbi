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

  sig { returns(String) }
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

  sig { returns(::SpellBook::ActiveRecord_Associations_CollectionProxy) }
  def spell_books; end

  sig { params(value: T.any(T::Array[::SpellBook], ::SpellBook::ActiveRecord_Associations_CollectionProxy)).void }
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
  extend SorbetRails::CustomFinderMethods
  extend Wizard::CustomFinderMethods
  extend T::Sig
  extend T::Generic
  extend Wizard::ModelRelationShared

  sig { returns(T::Hash[T.any(String, Symbol), Integer]) }
  def self.houses; end

  sig { returns(Wizard::ActiveRecord_Relation) }
  def self.Gryffindor; end

  sig { returns(Wizard::ActiveRecord_Relation) }
  def self.Hufflepuff; end

  sig { returns(Wizard::ActiveRecord_Relation) }
  def self.Ravenclaw; end

  sig { returns(Wizard::ActiveRecord_Relation) }
  def self.Slytherin; end

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

module Wizard::ModelRelationShared
  extend T::Sig

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def Gryffindor(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def Hufflepuff(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def Ravenclaw(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def Slytherin(*args); end

  sig { params(args: T.untyped).returns(Wizard::ActiveRecord_Relation) }
  def recent(*args); end

  sig { returns(Wizard::ActiveRecord_Relation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def select(*args, &block); end

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
  def merge(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::ActiveRecord_Relation) }
  def except(*args, &block); end
end

class Wizard::ActiveRecord_Relation < ActiveRecord::Relation
  include Wizard::ActiveRelation_WhereNot
  include SorbetRails::CustomFinderMethods
  include Wizard::CustomFinderMethods
  include Enumerable
  include Wizard::ModelRelationShared
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: Wizard)

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
end

class Wizard::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  include Wizard::ActiveRelation_WhereNot
  include SorbetRails::CustomFinderMethods
  include Wizard::CustomFinderMethods
  include Enumerable
  include Wizard::ModelRelationShared
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: Wizard)

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

  sig { params(records: T.any(Wizard, T::Array[Wizard])).returns(T.self_type) }
  def <<(*records); end

  sig { params(records: T.any(Wizard, T::Array[Wizard])).returns(T.self_type) }
  def append(*records); end

  sig { params(records: T.any(Wizard, T::Array[Wizard])).returns(T.self_type) }
  def push(*records); end

  sig { params(records: T.any(Wizard, T::Array[Wizard])).returns(T.self_type) }
  def concat(*records); end
end
