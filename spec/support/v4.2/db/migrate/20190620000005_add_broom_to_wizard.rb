# typed: false
class AddBroomToWizard < ActiveRecord::Migration
  def change
    add_column :wizards, :broom, :string
  end
end
