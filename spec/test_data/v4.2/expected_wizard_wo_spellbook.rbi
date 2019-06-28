# This is an autogenerated file for dynamic methods in Wizard
# Please rerun rake rails_rbi:models to regenerate.
# typed: strong

class Wizard::Relation < ActiveRecord::Relation
  include Wizard::ModelRelationShared
  extend T::Generic
  Elem = type_member(fixed: Wizard)
end

class Wizard::CollectionProxy < ActiveRecord::Associations::CollectionProxy
  include Wizard::ModelRelationShared
  extend T::Generic
  Elem = type_member(fixed: Wizard)
end

class Wizard < ApplicationRecord
  extend T::Sig
  extend T::Generic
  extend Wizard::ModelRelationShared
  extend Wizard::ClassMethods
  include Wizard::InstanceMethods
  Elem = type_template(fixed: Wizard)
end

module Wizard::InstanceMethods
  extend T::Sig

  sig { returns(T::Boolean) }
  def Gryffindor?(); end

  sig { returns(T::Boolean) }
  def Hufflepuff?(); end

  sig { returns(T::Boolean) }
  def Ravenclaw?(); end

  sig { returns(T::Boolean) }
  def Slytherin?(); end

  sig { returns(T.nilable(T.untyped)) }
  def created_at(); end

  sig { params(value: T.nilable(T.untyped)).void }
  def created_at=(value); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def created_at?(*args); end

  sig { returns(String) }
  def house(); end

  sig { params(value: T.nilable(T.any(Integer, String, Symbol))).void }
  def house=(value); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def house?(*args); end

  sig { returns(Integer) }
  def id(); end

  sig { params(value: Integer).void }
  def id=(value); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def id?(*args); end

  sig { returns(T.nilable(String)) }
  def name(); end

  sig { params(value: T.nilable(String)).void }
  def name=(value); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def name?(*args); end

  sig { returns(T.nilable(String)) }
  def notes(); end

  sig { params(value: T.nilable(String)).void }
  def notes=(value); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def notes?(*args); end

  sig { returns(T.nilable(String)) }
  def parent_email(); end

  sig { params(value: T.nilable(String)).void }
  def parent_email=(value); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def parent_email?(*args); end

  sig { returns(ActiveRecord::Associations::CollectionProxy[T.untyped]) }
  def spell_books(); end

  sig { params(value: T.any(T::Array[SpellBook], ActiveRecord::Associations::CollectionProxy[T.untyped])).void }
  def spell_books=(value); end

  sig { returns(T.nilable(T.untyped)) }
  def updated_at(); end

  sig { params(value: T.nilable(T.untyped)).void }
  def updated_at=(value); end

  sig { params(args: T.untyped).returns(T::Boolean) }
  def updated_at?(*args); end

  sig { returns(T.nilable(Wand)) }
  def wand(); end

  sig { params(value: T.nilable(Wand)).void }
  def wand=(value); end

end

module Wizard::ClassMethods
  extend T::Sig

  sig { returns(T::Hash[T.any(String, Symbol), Integer]) }
  def houses(); end

end

module Wizard::ModelRelationShared
  extend T::Sig

  sig { returns(Wizard::Relation) }
  def all(); end

  sig { params(args: T.untyped).returns(Wizard::Relation) }
  def Gryffindor(*args); end

  sig { params(args: T.untyped).returns(Wizard::Relation) }
  def Hufflepuff(*args); end

  sig { params(args: T.untyped).returns(Wizard::Relation) }
  def Ravenclaw(*args); end

  sig { params(args: T.untyped).returns(Wizard::Relation) }
  def Slytherin(*args); end

  sig { params(args: T.untyped).returns(Wizard::Relation) }
  def recent(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def select(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def order(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def reorder(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def group(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def limit(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def offset(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def joins(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def where(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def rewhere(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def preload(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def eager_load(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def includes(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def from(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def lock(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def readonly(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def having(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def create_with(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def distinct(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def references(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def none(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def unscope(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Wizard::Relation) }
  def except(*args, block); end

end
