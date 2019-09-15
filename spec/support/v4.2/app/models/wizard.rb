# typed: ignore
class Wizard < ApplicationRecord
  validates :name, length: { minimum: 5 }, presence: true

  enum house: {
    Gryffindor: 0,
    Hufflepuff: 1,
    Ravenclaw: 2,
    Slytherin: 3,
  }

  enum professor: {
    "Severus Snape": 0,
    "Minerva McGonagall": 1,
    "Pomona Sprout": 2,
    "Filius Flitwick": 3,
    "Hagrid": 4,
  }

  enum broom: {
    nimbus: 'nimbus',
    firebolt: 'firebolt',
  }

  has_one :wand
  has_many :spell_books

  scope :recent, -> { where('created_at > ?', 1.month.ago) }
end
