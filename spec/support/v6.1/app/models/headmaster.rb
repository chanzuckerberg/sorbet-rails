# typed: strong
class Headmaster < ApplicationRecord
  belongs_to :school, required: false
  belongs_to :wizard, optional: true

  validates :school, presence: true
  validates :wizard_id, presence: true
end
