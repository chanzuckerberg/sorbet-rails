class SpellBook < ApplicationRecord

  validates :name, length: { minimum: 5 }, presence: true

  belongs_to :wizard
end
