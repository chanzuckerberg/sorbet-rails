# typed: strong
class ActionMailer::Base
  extend T::Sig

  sig { returns(T::Array[Symbol]) }
  def self.action_methods; end
end