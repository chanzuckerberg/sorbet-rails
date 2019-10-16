# typed: strong

class Robe < ApplicationRecord
  belongs_to :wizard, optional: false
end
