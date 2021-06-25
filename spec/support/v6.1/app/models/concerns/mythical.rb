# typed: false
require 'active_support/concern'
module Mythical
  extend ActiveSupport::Concern

  class_methods do
    def mythicals
      all.to_a # yeah!
    end
  end
end
