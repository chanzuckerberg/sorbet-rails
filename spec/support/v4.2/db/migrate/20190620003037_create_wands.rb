class CreateWands < ActiveRecord::Migration
  def change
    create_table :wands do |t|
      t.references :wizard, unique: true, null: false
      t.string :wood_type
      t.integer :core_type

      t.timestamps
    end
  end
end
