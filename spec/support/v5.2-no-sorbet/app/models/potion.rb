# an abstract class that has no table
class Potion < ApplicationRecord
  self.abstract_class = true
end
