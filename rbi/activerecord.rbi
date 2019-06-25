# typed: strong
class ActiveRecord::Relation
  extend T::Sig
  extend T::Generic
  include Enumerable
  include ActiveRecord::Querying::Typed

  Elem = type_member

  sig { params(block: T.proc.params(e: Elem).void).void }
  def each(&block); end

  sig { params(level: T.nilable(Integer)).returns(T::Array[Elem]) }
  def flatten(level); end

  sig { returns(T::Array[Elem]) }
  def to_a; end

  # This is part of both FinderMethods & Enumerable module.
  # We need to define here to override the typedef in Enumerable module.
  # TODO normally this method could return Elem or Array[Elem]
  # however, we think it's better to limit the interface to returning Elem only
  # Use `find_n` as a replacement if you want to get an array from `find`
  sig { params(args: T.untyped).returns(Elem).soft }
  def find(*args); end
end

module ActiveRecord::Querying::Typed
  extend T::Sig
  extend T::Generic
  Elem = type_member

  # -- Booleans
  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(T::Boolean) }
  def exists?(*args, &block); end
  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(T::Boolean) }
  def any?(*args, &block); end
  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(T::Boolean) }
  def many?(*args, &block); end
  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(T::Boolean) }
  def none?(*args, &block); end
  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(T::Boolean) }
  def one?(*args, &block); end

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

  # These methods would return 1 single element when there is no limit, and return an
  # array of element when there is a limit passed in.
  # The more common use case is to find 1 object. We use that as the default sig
  # and add custom first_n, last_n method for the cases that return an array
  sig { params(limit: T.nilable(Integer)).returns(T.nilable(Elem)).soft }
  def first(limit = nil); end
  sig { params(limit: T.nilable(Integer)).returns(T.nilable(Elem)).soft }
  def last(limit = nil); end
  # Similar to first & last, normally this method could return Elem or Array[Elem]
  # But we enforce that `find` return Elem by default and provide find_n as an alternative
  sig { params(args: T.any(Integer, String)).returns(Elem).soft }
  def find(*args); end
  # These are custom finder methods to provide strong type for secondary use case of first, last & find
  # See sorbet_rails/custom_finder_methods
  sig { params(limit: Integer).returns(T::Array[Elem]) }
  def first_n(limit); end
  sig { params(limit: Integer).returns(T::Array[Elem]) }
  def last_n(limit); end
  sig { params(args: T::Array[T.any(Integer, String)]).returns(T::Array[Elem]) }
  def find_n(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(T.nilable(Elem)) }
  def find_by(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Elem) }
  def find_by!(*args, &block); end

  sig { params(id: Integer).returns(T.nilable(Elem)) }
  def find_by_id(id); end

  sig { params(id: Integer).returns(Elem) }
  def find_by_id!(id); end

  # -- Calculation
  # There can be a complication of using count with .group
  # https://api.rubyonrails.org/classes/ActiveRecord/Calculations.html#method-i-count
  # sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Integer) }
  # def count(*args, &block); end
end

module ActiveRecord::QueryMethods
  # TODO: where.not is a special case that we replace it with a `where_not` method
  # `where` when not given parameters will return a `ActiveRecord::QueryMethods::WhereChain`
  # instance that has a method `not` on it
  sig { params(opts: T.untyped, rest: T.untyped).returns(T.self_type) }
  def not(opts = nil, *rest); end
end

class ActiveRecord::Base
  extend ActiveRecord::Querying::Typed
  extend T::Generic
  Elem = type_template(fixed: ActiveRecord::Base)
end

class ApplicationRecord
  extend T::Generic
  Elem = type_template(fixed: ApplicationRecord)
end
