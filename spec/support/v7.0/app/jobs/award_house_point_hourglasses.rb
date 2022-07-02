# typed: strict
# N.B. You imagine the wizards update the point magically somehow?
# Nope, there is a "goblin" that takes their "give points" request and do it
# behind the scene.
class AwardHousePointHourglasses < ApplicationJob
  extend T::Sig

  sig { params(student: Wizard, point: Integer).void }
  def perform(student:, point:)
    # TODO: award point to student's house
  end
end
