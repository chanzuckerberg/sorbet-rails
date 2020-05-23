# typed: strong
module ActiveRecord::Enum

  sig { params(definitions: T::Hash[Symbol, T.untyped]).void }
  def typed_enum(definitions); end

end
