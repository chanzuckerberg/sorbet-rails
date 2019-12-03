# typed: strong
class ActiveRecord::Relation
  sig { params(args: T.untyped).returns(Elem) }
  def find(*args); end

  sig { params(args: T.untyped).returns(T.nilable(Elem)) }
  def find_by(*args); end

  sig { params(args: T.untyped).returns(Elem) }
  def find_by!(*args); end

  sig { returns(T.nilable(Elem)) }
  def first; end

  sig { returns(Elem) }
  def first!; end

  sig { returns(T.nilable(Elem)) }
  def second; end

  sig { returns(Elem) }
  def second!; end

  sig { returns(T.nilable(Elem)) }
  def third; end

  sig { returns(Elem) }
  def third!; end

  sig { returns(T.nilable(Elem)) }
  def third_to_last; end

  sig { returns(Elem) }
  def third_to_last!; end

  sig { returns(T.nilable(Elem)) }
  def second_to_last; end

  sig { returns(Elem) }
  def second_to_last!; end

  sig { returns(T.nilable(Elem)) }
  def last; end

  sig { returns(Elem) }
  def last!; end
end
