# typed: false
class CreateWizards < ActiveRecord::Migration[5.0]
  def change
    create_table :wizards do |t|
      t.string :name
      t.integer :house
      t.string :parent_email
      t.text :notes

      t.timestamps null: false
    end
  end
end
