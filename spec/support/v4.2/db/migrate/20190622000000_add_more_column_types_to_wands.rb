# typed: false
class AddMoreColumnTypesToWands < ActiveRecord::Migration
  def change
    add_column :wands, :flexibility,    :float,   null: false, default: 0.5
    add_column :wands, :hardness,       :decimal, null: false, precision: 10, scale: 10, default: 5
    add_column :wands, :reflectance,    :decimal, null: false, precision: 10, scale: 0, default: 0.5
    add_column :wands, :broken,         :boolean, null: false, default: false
    add_column :wands, :chosen_at_date, :date
    add_column :wands, :chosen_at_time, :time
  end
end
