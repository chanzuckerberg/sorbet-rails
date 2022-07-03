# typed: true
class AddBroomToWizard < ActiveRecord::Migration[7.0]
  def change
    add_column :wizards, :broom, :string
  end
end
