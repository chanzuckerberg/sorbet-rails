# typed: true
class AddMoreColumnTypesToWands < ActiveRecord::Migration[6.0]
  def change
    add_column :wands, :flexibility,    :float,   null: false, default: 0.5
    add_column :wands, :hardness,       :decimal, null: false, precision: 10, scale: 10, default: 5
    add_column :wands, :reflectance,    :decimal, null: false, precision: 10, scale: 0, default: 0.5
    add_column :wands, :broken,         :boolean, null: false, default: false
    add_column :wands, :broken_at,      :datetime, null: true
    add_column :wands, :chosen_at_date, :date
    add_column :wands, :chosen_at_time, :time
    # JSON column type is only supported on 5.2 or higher
    unless ['5.0', '5.1'].include?(ENV['RAILS_VERSION'])
      add_column :wands, :spell_history,  :json
      add_column :wands, :maker_info,     :json,    null: false, default: '{}'
    end
  end
end
