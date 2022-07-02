# typed: false
class Wizard < ApplicationRecord
  validates :name, length: { minimum: 5 }, presence: true
  # simulate conditional validation
  validates :parent_email, presence: true, if: :Slytherin?

  typed_enum house: {
    Gryffindor: 0,
    Hufflepuff: 1,
    Ravenclaw: 2,
    Slytherin: 3,
  }

  # To create conflict with enum
  class Professor; end

  enum professor: {
    "Severus Snape": 0,
    "Minerva McGonagall": 1,
    "Pomona Sprout": 2,
    "Filius Flitwick": 3,
    "Hagrid": 4,
    "Alastor 'Mad-Eye' Moody": 5,
  }

  typed_enum broom: {
    nimbus: 'nimbus',
    firebolt: 'firebolt',
  }, _prefix: true

  typed_enum quidditch_position: {
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

  serialize :owl_results, Hash
  serialize :newt_subjects # no specific data type, uses the default YAML Object coder
  serialize :pets, Array
  serialize :patronus_characteristics, JSON

  has_one :wand
  has_many :spell_books
  # habtm which is optional at the db level
  has_and_belongs_to_many :subjects

  # simulate when belongs_to is optional by default
  belongs_to :school, optional: true

  scope :recent, -> { where('created_at > ?', 1.month.ago) }
  
end
