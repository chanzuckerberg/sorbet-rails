# typed: strong
class School < ApplicationRecord
  has_one :headmaster
  validates :headmaster, presence: true
end
