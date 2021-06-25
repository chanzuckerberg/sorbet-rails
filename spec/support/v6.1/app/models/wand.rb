# typed: true
class Wand < ApplicationRecord
  include Mythical

  self.skip_time_zone_conversion_for_attributes = [:broken_at]

  enum core_type: {
    phoenix_feather: 0,
    dragon_heartstring: 1,
    unicorn_tail_hair: 2,
    basilisk_horn: 3,
  }

  belongs_to :wizard, required: true

  def wood_type
    'Type ' + super
  end
end
