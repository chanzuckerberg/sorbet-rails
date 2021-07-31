# typed: false
class HogwartsAcceptanceMailer < ApplicationMailer
  extend T::Sig

  sig { params(student: Wizard).void }
  def notify(student)
    # TODO: mail acceptance letter to student
  end

  sig {
    params(
      teacher: Wizard,
      note: String,
      student: Wizard,
      special: T::Boolean,
    ).void
  }
  def notify_teacher(
    teacher,
    note=nil,
    student:,
    special: false
  ) # TODO: let the teacher know when a students accepted offer
  end

  def notify_retry(student)
    # TODO: send more owls!!
  end
end
