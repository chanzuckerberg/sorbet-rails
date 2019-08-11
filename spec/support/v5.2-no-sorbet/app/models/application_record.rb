class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :recent, -> { where('created_at > ?', 1.month.ago) }
end
