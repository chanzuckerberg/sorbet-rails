# typed: true
class HogwartsAcceptanceMailer < ApplicationMailer
  extend T::Sig

  sig { params(student: Wizard).void }
  def notify(student)
    # TODO: mail acceptance letter to student
  end

  def notify_retry(student)
    # TODO: send more owls!!
  end
end
