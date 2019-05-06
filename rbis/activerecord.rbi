# typed: true
class ActiveRecord::Relation
  extend T::Sig
  extend T::Generic
  include Enumerable

  Elem = type_member

  sig { params(block: T.proc.params(e: Elem).void).void }
  def each(&block); end

  sig { params(level: T.nilable(Integer)).returns(T::Array[Elem]) }
  def flatten(level); end
end
