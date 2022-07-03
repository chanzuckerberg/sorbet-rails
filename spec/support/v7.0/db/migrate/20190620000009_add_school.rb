# typed: true
class AddSchool < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.string :name
    end
    add_column :wizards, :school_id, :integer
    add_foreign_key :wizards, :schools
  end
end
