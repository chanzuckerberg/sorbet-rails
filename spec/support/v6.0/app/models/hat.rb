# typed: strong

class Hat < ApplicationRecord
  belongs_to :wizard, required: true
end
