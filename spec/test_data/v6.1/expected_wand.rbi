# This is an autogenerated file for dynamic methods in Wand
# Please rerun bundle exec rake rails_rbi:models[Wand] to regenerate.

# typed: strong
module Wand::EnumInstanceMethods
  sig { returns(T::Boolean) }
  def phoenix_feather?; end

  sig { void }
  def phoenix_feather!; end

  sig { returns(T::Boolean) }
  def dragon_heartstring?; end

  sig { void }
  def dragon_heartstring!; end

  sig { returns(T::Boolean) }
  def unicorn_tail_hair?; end

  sig { void }
  def unicorn_tail_hair!; end

  sig { returns(T::Boolean) }
  def basilisk_horn?; end

  sig { void }
  def basilisk_horn!; end
end

module Wand::ActiveRelation_WhereNot
  sig { params(opts: T.untyped, rest: T.untyped).returns(T.self_type) }
  def not(opts, *rest); end
end

module Wand::GeneratedAttributeMethods
  sig { returns(T::Boolean) }
  def broken; end

  sig { params(value: T::Boolean).void }
  def broken=(value); end

  sig { returns(T::Boolean) }
  def broken?; end

  sig { returns(T.nilable(Time)) }
  def broken_at; end

  sig { params(value: T.nilable(Time)).void }
  def broken_at=(value); end

  sig { returns(T::Boolean) }
  def broken_at?; end

  sig { returns(T.nilable(Date)) }
  def chosen_at_date; end

  sig { params(value: T.nilable(Date)).void }
  def chosen_at_date=(value); end

  sig { returns(T::Boolean) }
  def chosen_at_date?; end

  sig { returns(T.nilable(ActiveSupport::TimeWithZone)) }
  def chosen_at_time; end

  sig { params(value: T.nilable(T.any(Date, Time, ActiveSupport::TimeWithZone))).void }
  def chosen_at_time=(value); end

  sig { returns(T::Boolean) }
  def chosen_at_time?; end

  sig { returns(T.nilable(String)) }
  def core_type; end

  sig { params(value: T.nilable(T.any(Integer, String, Symbol))).void }
  def core_type=(value); end

  sig { returns(T::Boolean) }
  def core_type?; end

  sig { returns(ActiveSupport::TimeWithZone) }
  def created_at; end

  sig { params(value: T.any(Date, Time, ActiveSupport::TimeWithZone)).void }
  def created_at=(value); end

  sig { returns(T::Boolean) }
  def created_at?; end

  sig { returns(Float) }
  def flexibility; end

  sig { params(value: T.any(Numeric, ActiveSupport::Duration)).void }
  def flexibility=(value); end

  sig { returns(T::Boolean) }
  def flexibility?; end

  sig { returns(BigDecimal) }
  def hardness; end

  sig { params(value: T.any(Numeric, ActiveSupport::Duration)).void }
  def hardness=(value); end

  sig { returns(T::Boolean) }
  def hardness?; end

  sig { returns(Integer) }
  def id; end

  sig { params(value: T.any(Numeric, ActiveSupport::Duration)).void }
  def id=(value); end

  sig { returns(T::Boolean) }
  def id?; end

  sig { returns(T.any(T::Array[T.untyped], T::Boolean, Float, T::Hash[T.untyped, T.untyped], Integer, String)) }
  def maker_info; end

  sig { params(value: T.any(T::Array[T.untyped], T::Boolean, Float, T::Hash[T.untyped, T.untyped], Integer, String)).void }
  def maker_info=(value); end

  sig { returns(T::Boolean) }
  def maker_info?; end

  sig { returns(Integer) }
  def reflectance; end

  sig { params(value: T.any(Numeric, ActiveSupport::Duration)).void }
  def reflectance=(value); end

  sig { returns(T::Boolean) }
  def reflectance?; end

  sig { returns(T.nilable(T.any(T::Array[T.untyped], T::Boolean, Float, T::Hash[T.untyped, T.untyped], Integer, String))) }
  def spell_history; end

  sig { params(value: T.nilable(T.any(T::Array[T.untyped], T::Boolean, Float, T::Hash[T.untyped, T.untyped], Integer, String))).void }
  def spell_history=(value); end

  sig { returns(T::Boolean) }
  def spell_history?; end

  sig { returns(ActiveSupport::TimeWithZone) }
  def updated_at; end

  sig { params(value: T.any(Date, Time, ActiveSupport::TimeWithZone)).void }
  def updated_at=(value); end

  sig { returns(T::Boolean) }
  def updated_at?; end

  sig { returns(Integer) }
  def wizard_id; end

  sig { params(value: T.any(Numeric, ActiveSupport::Duration)).void }
  def wizard_id=(value); end

  sig { returns(T::Boolean) }
  def wizard_id?; end

  sig { returns(T.nilable(String)) }
  def wood_type; end

  sig { params(value: T.nilable(T.any(String, Symbol))).void }
  def wood_type=(value); end

  sig { returns(T::Boolean) }
  def wood_type?; end
end

module Wand::GeneratedAssociationMethods
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

  sig { returns(::Wizard) }
  def reload_wizard; end
end

module Wand::CustomFinderMethods
  sig { params(limit: Integer).returns(T::Array[Wand]) }
  def first_n(limit); end

  sig { params(limit: Integer).returns(T::Array[Wand]) }
  def last_n(limit); end

  sig { params(args: T::Array[T.any(Integer, String)]).returns(T::Array[Wand]) }
  def find_n(*args); end

  sig { params(id: T.nilable(Integer)).returns(T.nilable(Wand)) }
  def find_by_id(id); end

  sig { params(id: Integer).returns(Wand) }
  def find_by_id!(id); end
end

class Wand < ApplicationRecord
  include Wand::EnumInstanceMethods
  include Wand::GeneratedAttributeMethods
  include Wand::GeneratedAssociationMethods
  extend Wand::CustomFinderMethods
  extend Wand::QueryMethodsReturningRelation
  RelationType = T.type_alias { T.any(Wand::ActiveRecord_Relation, Wand::ActiveRecord_Associations_CollectionProxy, Wand::ActiveRecord_AssociationRelation) }

  sig { returns(T::Hash[T.any(String, Symbol), Integer]) }
  def self.core_types; end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def self.basilisk_horn(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def self.dragon_heartstring(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def self.not_basilisk_horn(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def self.not_dragon_heartstring(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def self.not_phoenix_feather(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def self.not_unicorn_tail_hair(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def self.phoenix_feather(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def self.unicorn_tail_hair(*args); end

  sig { returns(T.nilable(Wand::CoreType)) }
  def typed_core_type; end

  sig { params(value: T.nilable(Wand::CoreType)).void }
  def typed_core_type=(value); end

  class CoreType < T::Enum
    enums do
      PhoenixFeather = new(%q{phoenix_feather})
      DragonHeartstring = new(%q{dragon_heartstring})
      UnicornTailHair = new(%q{unicorn_tail_hair})
      BasiliskHorn = new(%q{basilisk_horn})
    end

  end

  sig { returns(T::Array[Wand]) }
  def self.mythicals; end
end

class Wand::ActiveRecord_Relation < ActiveRecord::Relation
  include Wand::ActiveRelation_WhereNot
  include Wand::CustomFinderMethods
  include Wand::QueryMethodsReturningRelation
  Elem = type_member(fixed: Wand)

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def basilisk_horn(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def dragon_heartstring(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def not_basilisk_horn(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def not_dragon_heartstring(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def not_phoenix_feather(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def not_unicorn_tail_hair(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def phoenix_feather(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def unicorn_tail_hair(*args); end
end

class Wand::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  include Wand::ActiveRelation_WhereNot
  include Wand::CustomFinderMethods
  include Wand::QueryMethodsReturningAssociationRelation
  Elem = type_member(fixed: Wand)

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def basilisk_horn(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def dragon_heartstring(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def not_basilisk_horn(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def not_dragon_heartstring(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def not_phoenix_feather(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def not_unicorn_tail_hair(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def phoenix_feather(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def unicorn_tail_hair(*args); end
end

class Wand::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  include Wand::CustomFinderMethods
  include Wand::QueryMethodsReturningAssociationRelation
  Elem = type_member(fixed: Wand)

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def basilisk_horn(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def dragon_heartstring(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def not_basilisk_horn(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def not_dragon_heartstring(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def not_phoenix_feather(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def not_unicorn_tail_hair(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def phoenix_feather(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def unicorn_tail_hair(*args); end

  sig { params(records: T.any(Wand, T::Array[Wand])).returns(T.self_type) }
  def <<(*records); end

  sig { params(records: T.any(Wand, T::Array[Wand])).returns(T.self_type) }
  def append(*records); end

  sig { params(records: T.any(Wand, T::Array[Wand])).returns(T.self_type) }
  def push(*records); end

  sig { params(records: T.any(Wand, T::Array[Wand])).returns(T.self_type) }
  def concat(*records); end
end

module Wand::QueryMethodsReturningRelation
  sig { returns(Wand::ActiveRecord_Relation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Wand::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def reselect(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def extract_associated(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def optimizer_hints(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def except(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_Relation) }
  def only(*args); end

  sig { params(block: T.proc.params(e: Wand).returns(T::Boolean)).returns(T::Array[Wand]) }
  def select(&block); end

  sig { params(args: T.any(String, Symbol, T::Array[T.any(String, Symbol)])).returns(Wand::ActiveRecord_Relation) }
  def select_columns(*args); end

  sig { params(args: Symbol).returns(Wand::ActiveRecord_Relation) }
  def where_missing(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::ActiveRecord_Relation) }
  def extending(*args, &block); end

  sig do
    params(
      of: T.nilable(Integer),
      start: T.nilable(Integer),
      finish: T.nilable(Integer),
      load: T.nilable(T::Boolean),
      error_on_ignore: T.nilable(T::Boolean),
      block: T.nilable(T.proc.params(e: Wand::ActiveRecord_Relation).void)
    ).returns(ActiveRecord::Batches::BatchEnumerator)
  end
  def in_batches(of: 1000, start: nil, finish: nil, load: false, error_on_ignore: nil, &block); end
end

module Wand::QueryMethodsReturningAssociationRelation
  sig { returns(Wand::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Wand::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def reselect(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def extract_associated(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def optimizer_hints(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped).returns(Wand::ActiveRecord_AssociationRelation) }
  def only(*args); end

  sig { params(block: T.proc.params(e: Wand).returns(T::Boolean)).returns(T::Array[Wand]) }
  def select(&block); end

  sig { params(args: T.any(String, Symbol, T::Array[T.any(String, Symbol)])).returns(Wand::ActiveRecord_AssociationRelation) }
  def select_columns(*args); end

  sig { params(args: Symbol).returns(Wand::ActiveRecord_AssociationRelation) }
  def where_missing(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end

  sig do
    params(
      of: T.nilable(Integer),
      start: T.nilable(Integer),
      finish: T.nilable(Integer),
      load: T.nilable(T::Boolean),
      error_on_ignore: T.nilable(T::Boolean),
      block: T.nilable(T.proc.params(e: Wand::ActiveRecord_AssociationRelation).void)
    ).returns(ActiveRecord::Batches::BatchEnumerator)
  end
  def in_batches(of: 1000, start: nil, finish: nil, load: false, error_on_ignore: nil, &block); end
end
