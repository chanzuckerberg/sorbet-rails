# typed: false
class AddBroomToWizard < ActiveRecord::Migration[5.1]
  def change
    add_column :wizards, :broom, :string
  end
end
