# typed: strong
class ActiveRecord::Relation
  extend T::Sig
  extend T::Generic
  include Enumerable
  include SorbetRails::CustomFinderMethods

  Elem = type_member(fixed: ActiveRecord::Base)

  sig { params(block: T.proc.params(e: Elem).void).void }
  def each(&block); end

  sig { params(level: T.nilable(Integer)).returns(T::Array[Elem]) }
  def flatten(level); end

  sig { returns(T::Array[Elem]) }
  def to_a; end

  # This is part of both FinderMethods & Enumerable module.
  # These methods would return 1 single element when there is no limit, and return an
  # array of element when there is a limit passed in.
  # The more common use case is to find 1 object. We use that as the default sig
  # and add custom first_n, last_n method for the cases that return an array
  sig { params(args: T.untyped).returns(Elem) }
  def find(*args); end
  sig { params(limit: T.nilable(Integer)).returns(T.nilable(Elem)) }
  def first(limit = nil); end
  sig { params(limit: T.nilable(Integer)).returns(T.nilable(Elem)) }
  def last(limit = nil); end

  # -- place here to avoid conflicts with sorbet generated gem rbi
  sig { params(conditions: T.untyped).returns(T::Boolean) }
  def exists?(conditions = nil); end
  sig { returns(T::Boolean) }
  def any?; end
  sig { returns(T::Boolean) }
  def many?; end
  sig { returns(T::Boolean) }
  def none?; end
  sig { returns(T::Boolean) }
  def one?; end

  # -- finder methods
  sig { returns(Elem) }
  def first!; end
  sig { returns(Elem) }
  def second!; end
  sig { returns(T.nilable(Elem)) }
  def second; end
  sig { returns(Elem) }
  def third!; end
  sig { returns(T.nilable(Elem)) }
  def third; end
  sig { returns(Elem) }
  def fourth!; end
  sig { returns(T.nilable(Elem)) }
  def fourth; end
  sig { returns(Elem) }
  def fifth!; end
  sig { returns(T.nilable(Elem)) }
  def fifth; end

  sig { returns(Elem) }
  def last!; end
  sig { returns(Elem) }
  def third_to_last!; end
  sig { returns(T.nilable(Elem)) }
  def third_to_last; end
  sig { returns(Elem) }
  def second_to_last!; end
  sig { returns(T.nilable(Elem)) }
  def second_to_last; end

  sig { params(arg: T.untyped, args: T.untyped).returns(T.nilable(Elem)) }
  def find_by(arg, *args); end
  sig { params(arg: T.untyped, args: T.untyped).returns(Elem) }
  def find_by!(arg, *args); end
end

class ActiveRecord::Associations::CollectionProxy < ActiveRecord::Relation
  extend T::Generic

  Elem = type_member(fixed: ActiveRecord::Base)

  sig { params(block: T.proc.params(e: Elem).void).void }
  def each(&block); end

  sig { returns(T::Array[Elem]) }
  def to_a; end

  # -- << and aliases
  sig { params(records: T.any(Elem, T::Array[Elem])).returns(T.self_type) }
  def <<(*records); end
  sig { params(records: T.any(Elem, T::Array[Elem])).returns(T.self_type) }
  def append(*records); end
  sig { params(records: T.any(Elem, T::Array[Elem])).returns(T.self_type) }
  def push(*records); end
  sig { params(records: T.any(Elem, T::Array[Elem])).returns(T.self_type) }
  def concat(*records); end

  # -- Overridden finder methods
  sig { params(args: T.untyped).returns(Elem) }
  def find(*args); end
  # sig { params(limit: T.nilable(Integer)).returns(T.nilable(Elem)) }
  # def last(limit = nil); end
end

module SorbetRails::CustomFinderMethods
  extend T::Sig
  extend T::Generic
  Elem = type_member(fixed: ActiveRecord::Base)

  # These are custom finder methods to provide strong type for secondary use case of first, last & find
  # See sorbet_rails/custom_finder_methods
  sig { params(limit: Integer).returns(T::Array[Elem]) }
  def first_n(limit); end
  sig { params(limit: Integer).returns(T::Array[Elem]) }
  def last_n(limit); end
  sig { params(args: T::Array[T.any(Integer, String)]).returns(T::Array[Elem]) }
  def find_n(*args); end

  # allow common cases of find_by
  sig { params(id: Integer).returns(T.nilable(Elem)) }
  def find_by_id(id); end
  sig { params(id: Integer).returns(Elem) }
  def find_by_id!(id); end
end

module ActiveRecord::QueryMethods
  # TODO: where.not is a special case that we replace it with a `where_not` method
  # `where` when not given parameters will return a `ActiveRecord::QueryMethods::WhereChain`
  # instance that has a method `not` on it
  sig { params(opts: T.untyped, rest: T.untyped).returns(T.self_type) }
  def not(opts = nil, *rest); end
end

class ActiveRecord::Base
  extend SorbetRails::CustomFinderMethods
  extend T::Generic
  Elem = type_template(fixed: ActiveRecord::Base)

  # -- place here to avoid conflicts with sorbet generated gem rbis

  # These methods would return 1 single element when there is no limit, and return an
  # array of element when there is a limit passed in.
  # The more common use case is to find 1 object. We use that as the default sig
  # and add custom first_n, last_n method for the cases that return an array
  sig { params(args: T.untyped).returns(Elem) }
  def self.find(*args); end
  sig { params(limit: T.nilable(Integer)).returns(T.nilable(Elem)) }
  def self.first(limit = nil); end
  sig { params(limit: T.nilable(Integer)).returns(T.nilable(Elem)) }
  def self.last(limit = nil); end

  # -- place here to avoid conflicts with sorbet generated gem rbi
  sig { params(conditions: T.untyped).returns(T::Boolean) }
  def self.exists?(conditions = nil); end
  sig { returns(T::Boolean) }
  def self.any?; end
  sig { returns(T::Boolean) }
  def self.many?; end
  sig { returns(T::Boolean) }
  def self.none?; end
  sig { returns(T::Boolean) }
  def self.one?; end

  # -- finder methods
  sig { returns(Elem) }
  def self.first!; end
  sig { returns(Elem) }
  def self.second!; end
  sig { returns(T.nilable(Elem)) }
  def self.second; end
  sig { returns(Elem) }
  def self.third!; end
  sig { returns(T.nilable(Elem)) }
  def self.third; end
  sig { returns(Elem) }
  def self.fourth!; end
  sig { returns(T.nilable(Elem)) }
  def self.fourth; end
  sig { returns(Elem) }
  def self.fifth!; end
  sig { returns(T.nilable(Elem)) }
  def self.fifth; end

  sig { returns(Elem) }
  def self.last!; end
  sig { returns(Elem) }
  def self.third_to_last!; end
  sig { returns(T.nilable(Elem)) }
  def self.third_to_last; end
  sig { returns(Elem) }
  def self.second_to_last!; end
  sig { returns(T.nilable(Elem)) }
  def self.second_to_last; end

  sig { params(arg: T.untyped, args: T.untyped).returns(T.nilable(Elem)) }
  def self.find_by(arg, *args); end
  sig { params(arg: T.untyped, args: T.untyped).returns(Elem) }
  def self.find_by!(arg, *args); end
end

class ApplicationRecord < ActiveRecord::Base
  extend T::Generic
  Elem = type_template(fixed: ApplicationRecord)
end
