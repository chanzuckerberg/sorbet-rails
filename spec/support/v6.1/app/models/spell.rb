# typed: strong
class Spell < ApplicationRecord
  # habtm enforced at the DB level
  has_and_belongs_to_many :spell_books
end
