# typed: strict
class Robe < ApplicationRecord
  belongs_to :wizard, required: false
end
