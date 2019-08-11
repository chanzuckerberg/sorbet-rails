# typed: ignore
class CreateWizards < ActiveRecord::Migration["#{ENV['RAILS_VERSION'] || 5.2}"]
  def change
    create_table :wizards do |t|
      t.string :name
      t.integer :house
      t.string :parent_email
      t.text :notes

      t.timestamps
    end
  end
end
