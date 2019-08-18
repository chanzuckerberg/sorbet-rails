# typed: strict
class Wizard < ApplicationRecord
  validates :name, length: { minimum: 5 }, presence: true

  enum house: {
    Gryffindor: 0,
    Hufflepuff: 1,
    Ravenclaw: 2,
    Slytherin: 3,
  }

  has_one :wand
  has_many :spell_books

  scope :recent, -> { where('created_at > ?', 1.month.ago) }
end
