# typed: true
class AddBroomToWizard < ActiveRecord::Migration[5.2]
  def change
    add_column :wizards, :broom, :string
  end
end
