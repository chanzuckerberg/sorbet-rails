# typed: false
class AddTypeToWizard < ActiveRecord::Migration
  def change
    add_column :wizards, :type, :string, null: false, default: 'Wizard'
  end
end
