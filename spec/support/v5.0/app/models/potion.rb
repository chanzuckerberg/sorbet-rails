# typed: strong
# an abstract class that has no table
class Potion < ApplicationRecord
  self.abstract_class = true
  belongs_to :wizard, required: false
end
