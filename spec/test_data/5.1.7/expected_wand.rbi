# This is an autogenerated file for dynamic methods in Wand
# Please rerun rake rails_rbi:models to regenerate.
# typed: strong

class Wand::Relation < ActiveRecord::Relation
  include Wand::ModelRelationShared
  extend T::Generic
  Elem = type_member(fixed: Wand)
end

class Wand::CollectionProxy < ActiveRecord::Associations::CollectionProxy
  include Wand::ModelRelationShared
  extend T::Generic
  Elem = type_member(fixed: Wand)
end

class Wand < ApplicationRecord
  extend T::Sig
  extend T::Generic
  extend Wand::ModelRelationShared
  extend Wand::ClassMethods
  include Wand::InstanceMethods
  Elem = type_template(fixed: Wand)
end

module Wand::InstanceMethods
  extend T::Sig

  sig { returns(T::Boolean) }
  def basilisk_horn?(); end

  sig { returns(T::Boolean) }
  def broken(); end

  sig { params(value: T::Boolean).void }
  def broken=(value); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def broken?(*args); end

  sig { returns(T.nilable(Date)) }
  def chosen_at_date(); end

  sig { params(value: T.nilable(Date)).void }
  def chosen_at_date=(value); end

  sig { returns(T.nilable(Time)) }
  def chosen_at_time(); end

  sig { params(value: T.nilable(Time)).void }
  def chosen_at_time=(value); end

  sig { returns(String) }
  def core_type(); end

  sig { params(value: T.nilable(T.any(Integer, String, Symbol))).void }
  def core_type=(value); end

  sig { returns(DateTime) }
  def created_at(); end

  sig { params(value: DateTime).void }
  def created_at=(value); end

  sig { returns(T::Boolean) }
  def dragon_heartstring?(); end

  sig { returns(Float) }
  def flexibility(); end

  sig { params(value: Float).void }
  def flexibility=(value); end

  sig { returns(BigDecimal) }
  def hardness(); end

  sig { params(value: BigDecimal).void }
  def hardness=(value); end

  sig { returns(Integer) }
  def id(); end

  sig { params(value: Integer).void }
  def id=(value); end

  sig { returns(T::Boolean) }
  def phoenix_feather?(); end

  sig { returns(Integer) }
  def reflectance(); end

  sig { params(value: Integer).void }
  def reflectance=(value); end

  sig { returns(T::Boolean) }
  def unicorn_tail_hair?(); end

  sig { returns(DateTime) }
  def updated_at(); end

  sig { params(value: DateTime).void }
  def updated_at=(value); end

  sig { returns(Wizard) }
  def wizard(); end

  sig { params(value: Wizard).void }
  def wizard=(value); end

  sig { returns(Integer) }
  def wizard_id(); end

  sig { params(value: Integer).void }
  def wizard_id=(value); end

  sig { returns(T.nilable(String)) }
  def wood_type(); end

  sig { params(value: T.nilable(String)).void }
  def wood_type=(value); end

end

module Wand::ClassMethods
  extend T::Sig

  sig { returns(T::Hash[T.any(String, Symbol), Integer]) }
  def core_types(); end

end

module Wand::ModelRelationShared
  extend T::Sig

  sig { returns(Wand::Relation) }
  def all(); end

  sig { params(args: T.untyped).returns(Wand::Relation) }
  def basilisk_horn(*args); end

  sig { params(args: T.untyped).returns(Wand::Relation) }
  def dragon_heartstring(*args); end

  sig { params(args: T.untyped).returns(Wand::Relation) }
  def phoenix_feather(*args); end

  sig { params(args: T.untyped).returns(Wand::Relation) }
  def recent(*args); end

  sig { params(args: T.untyped).returns(Wand::Relation) }
  def unicorn_tail_hair(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def select(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def order(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def reorder(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def group(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def limit(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def offset(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def joins(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def left_joins(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def left_outer_joins(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def where(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def rewhere(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def preload(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def eager_load(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def includes(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def from(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def lock(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def readonly(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def extending(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def or(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def having(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def create_with(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def distinct(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def references(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def none(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def unscope(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def merge(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wand::Relation) }
  def except(*args, block); end

end


