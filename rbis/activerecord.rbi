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

module ActiveRecord::Querying
  extend T::Sig
  extend T::Generic
  Elem = type_member
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
