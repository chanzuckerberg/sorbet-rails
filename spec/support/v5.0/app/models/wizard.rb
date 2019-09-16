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
  }, _prefix: true

  enum quidditch_position: {
    keeper: 0,
    seeker: 1,
    beater: 2,
    chaser: 3,
  }, _prefix: :quidditch

  enum hair_color: {
    brown: 0,
    black: 1,
    blonde: 2,
  }, _suffix: :hair

  enum eye_color: {
    brown: 0,
    green: 1,
    blue: 2,
  }, _prefix: :color, _suffix: :eyes

  has_one :wand
  has_many :spell_books

  scope :recent, -> { where('created_at > ?', 1.month.ago) }
  
end
