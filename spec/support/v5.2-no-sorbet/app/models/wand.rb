class Wand < ApplicationRecord
  include Mythical

  enum core_type: {
    phoenix_feather: 0,
    dragon_heartstring: 1,
    unicorn_tail_hair: 2,
    basilisk_horn: 3,
  }

  belongs_to :wizard

  def wood_type
    'Type ' + super
  end
end
