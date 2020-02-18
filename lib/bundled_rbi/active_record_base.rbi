# typed: strong
class ActiveRecord::Base
  sig { params(args: T.untyped).returns(T.attached_class) }
  def self.find(*args); end

  sig { params(args: T.untyped).returns(T.nilable(T.attached_class)) }
  def self.find_by(*args); end

  sig { params(args: T.untyped).returns(T.attached_class) }
  def self.find_by!(*args); end

  sig {
    params(
      attributes: T.untyped,
      block: T.nilable(T.proc.params(object: T.attached_class).void),
    ).
    returns(T.attached_class)
  }
  def self.find_or_initialize_by(attributes, &block); end

  sig {
    params(
      attributes: T.untyped,
      block: T.nilable(T.proc.params(object: T.attached_class).void),
    ).
    returns(T.attached_class)
  }
  def self.find_or_create_by(attributes, &block); end

  sig {
    params(
      attributes: T.untyped,
      block: T.nilable(T.proc.params(object: T.attached_class).void),
    ).
    returns(T.attached_class)
  }
  def self.find_or_create_by!(attributes, &block); end

  sig { returns(T.nilable(T.attached_class)) }
  def self.first; end

  sig { returns(T.attached_class) }
  def self.first!; end

  sig { returns(T.nilable(T.attached_class)) }
  def self.second; end

  sig { returns(T.attached_class) }
  def self.second!; end

  sig { returns(T.nilable(T.attached_class)) }
  def self.third; end

  sig { returns(T.attached_class) }
  def self.third!; end

  sig { returns(T.nilable(T.attached_class)) }
  def self.third_to_last; end

  sig { returns(T.attached_class) }
  def self.third_to_last!; end

  sig { returns(T.nilable(T.attached_class)) }
  def self.second_to_last; end

  sig { returns(T.attached_class) }
  def self.second_to_last!; end

  sig { returns(T.nilable(T.attached_class)) }
  def self.last; end

  sig { returns(T.attached_class) }
  def self.last!; end

  sig { params(attributes: T.untyped, block: T.untyped).returns(T.attached_class) }
  def self.create(attributes = nil, &block); end

  sig { params(attributes: T.untyped, block: T.untyped).returns(T.attached_class) }
  def self.create!(attributes = nil, &block); end

  sig { params(attributes: T.untyped, block: T.untyped).returns(T.attached_class) }
  def self.new(attributes = nil, &block); end
end
