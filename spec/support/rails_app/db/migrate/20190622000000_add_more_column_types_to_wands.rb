class AddMoreColumnTypesToWands < ActiveRecord::Migration[5.2]
  def change
    add_column :wands, :flexibility,    :float,   null: false
    add_column :wands, :hardness,       :decimal, null: false, precision: 10, scale: 10
    add_column :wands, :reflectance,    :decimal, null: false, precision: 10, scale: 0
    add_column :wands, :spell_history,  :json
    add_column :wands, :maker_info,     :json,    null: false
    add_column :wands, :broken,         :boolean, null: false
    add_column :wands, :chosen_at_date, :date
    add_column :wands, :chosen_at_time, :time
  end
end
