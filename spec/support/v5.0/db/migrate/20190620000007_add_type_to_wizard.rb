# typed: false
class AddTypeToWizard < ActiveRecord::Migration[5.0]
  def change
    add_column :wizards, :type, :string, null: false, default: 'Wizard'
  end
end
