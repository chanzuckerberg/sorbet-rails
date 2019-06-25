class AddMoreColumnTypesToWands < ActiveRecord::Migration[5.1]
  def change
    add_column :wands, :flexibility,    :float,   null: false, default: 0.5
    add_column :wands, :hardness,       :decimal, null: false, precision: 10, scale: 10, default: 5
    add_column :wands, :reflectance,    :decimal, null: false, precision: 10, scale: 0, default: 0.5
    add_column :wands, :broken,         :boolean, null: false, default: false
    add_column :wands, :chosen_at_date, :date
    add_column :wands, :chosen_at_time, :time
    if ENV['RAILS_VERSION'] != '5.1.7'
      # JSON column type is only supported on 5.2.4 version or higher
      add_column :wands, :spell_history,  :json
      add_column :wands, :maker_info,     :json,    null: false, default: '{}'
    end
  end
end
