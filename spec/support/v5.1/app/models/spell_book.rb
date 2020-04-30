# typed: strict
class SpellBook < ApplicationRecord
  validates :name, length: { minimum: 5 }, presence: true

  # simulate when belongs_to is optional by default, but it is enforced at the DB level
  belongs_to :wizard, optional: true

  # habtm enforced at the DB level
  has_and_belongs_to_many :spells

  enum book_type: {
    unclassified: 0,
    biology: 1,
    dark_art: 999,
  }

  scope :recent, -> { where('created_at > ?', 1.month.ago) }
end
