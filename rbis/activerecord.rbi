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

  # This is part of both FinderMethods & Enumerable module.
  # We need to define here to override the typedef in Enumerable module.
  # TODO normally this method could return Elem or Array[Elem]
  # however, we think it's better to limit the interface to returning Elem only
  sig { params(args: T.untyped).returns(Elem).soft }
  def find(*args); end
end

module ActiveRecord::Querying
  extend T::Sig
  extend T::Generic
  Elem = type_member

  # TODO normally this method could return Elem or Array[Elem]
  # however, we think it's better to limit the interface to returning Elem only
  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Elem).soft }
  def find(*args, &block); end
end

module ActiveRecord::QueryMethods
  # TODO: where.not is a special case that we replace it with a `where_not` method
  # `where` when not given parameters will return a `ActiveRecord::QueryMethods::WhereChain`
  # instance that has a method `not` on it
  sig { params(opts: T.untyped, rest: T.untyped).returns(T.self_type) }
  def not(opts = nil, *rest); end
end

class ActiveRecord::Base
  extend ActiveRecord::Querying
  extend T::Generic
  Elem = type_template(fixed: ActiveRecord::Base)
end

class ApplicationRecord
  extend T::Generic
  Elem = type_template(fixed: ApplicationRecord)
end
