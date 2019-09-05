# typed: true
class AddMoreEnumsToWizard < ActiveRecord::Migration[6.0]
  def change
    add_column :wizards, :quidditch_position, :integer
    add_column :wizards, :hair_color, :integer
    add_column :wizards, :eye_color, :integer
    add_column :wizards, :hair_length, :integer
  end
end
