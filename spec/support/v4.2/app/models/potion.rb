# typed: strong
# an abstract class that has no table
class Potion < ActiveRecord::Base
  self.abstract_class = true
end
