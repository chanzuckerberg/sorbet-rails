# typed: strong
class DailyProphetMailer < ApplicationMailer
  extend T::Sig

  sig { params(wizards: T::Array[Wizard], hotnews_only: T::Boolean).void }
  def notify_subscribers(wizards:, hotnews_only:)
    # TODO: mail the latest news to wizards!
  end
end
