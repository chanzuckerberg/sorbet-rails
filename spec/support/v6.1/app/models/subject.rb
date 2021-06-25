# typed: strong
class Subject < ApplicationRecord
  # habtm which is optional at the db level
  has_and_belongs_to_many :wizards
end
