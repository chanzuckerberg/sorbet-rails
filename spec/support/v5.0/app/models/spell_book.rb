# typed: strict
class SpellBook < ApplicationRecord
  validates :name, length: { minimum: 5 }, presence: true
  belongs_to :wizard

  enum book_type: {
    unclassified: 0,
    biology: 1,
    dark_art: 999,
  }
end
