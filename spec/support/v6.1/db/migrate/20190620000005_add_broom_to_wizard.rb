# typed: true
class AddBroomToWizard < ActiveRecord::Migration[6.0]
  def change
    add_column :wizards, :broom, :string
  end
end
