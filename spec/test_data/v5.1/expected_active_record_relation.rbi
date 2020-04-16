# typed: strong
class ActiveRecord::Relation
  Elem = type_member(fixed: T.untyped)

  sig { params(args: T.untyped).returns(Elem) }
  def find(*args); end

  sig { params(args: T.untyped).returns(T.nilable(Elem)) }
  def find_by(*args); end

  sig { params(args: T.untyped).returns(Elem) }
  def find_by!(*args); end

  sig {
    params(
      attributes: T.untyped,
      block: T.nilable(T.proc.params(object: Elem).void)
    ).
    returns(Elem)
  }
  def find_or_initialize_by(attributes, &block); end

  sig {
    params(
      attributes: T.untyped,
      block: T.nilable(T.proc.params(object: Elem).void)
    ).
    returns(Elem)
  }
  def find_or_create_by(attributes, &block); end

  sig {
    params(
      attributes: T.untyped,
      block: T.nilable(T.proc.params(object: Elem).void)
    ).
    returns(Elem)
  }
  def find_or_create_by!(attributes, &block); end

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

  sig do
    override.params(
      start: T.nilable(Integer),
      finish: T.nilable(Integer),
      batch_size: T.nilable(Integer),
      error_on_ignore: T.nilable(T::Boolean),
      block: T.nilable(T.proc.params(e: Elem).void) # block is optional, eg. you can do Klass.find_each.map
    ).returns(T::Array[Elem])
  end
  def find_each(start: nil, finish: nil, batch_size: 1000, error_on_ignore: nil, &block); end

  sig { override.params(block: T.proc.params(e: Elem).void).returns(T::Array[Elem]) }
  def each(&block); end

  sig { params(level: T.nilable(Integer)).returns(T::Array[Elem]) }
  def flatten(level); end

  sig { returns(T::Array[Elem]) }
  def to_a; end

  sig do
    type_parameters(:U).params(
        blk: T.proc.params(arg0: Elem).returns(T.type_parameter(:U)),
    )
    .returns(T::Array[T.type_parameter(:U)])
  end
  def map(&blk); end

  sig { params(conditions: T.untyped).returns(T::Boolean) }
  def exists?(conditions = nil); end

  sig { returns(T::Boolean) }
  def any?; end

  sig { returns(T::Boolean) }
  def empty?; end

  sig { returns(T::Boolean) }
  def many?; end

  sig { returns(T::Boolean) }
  def none?; end

  sig { returns(T::Boolean) }
  def one?; end
end
