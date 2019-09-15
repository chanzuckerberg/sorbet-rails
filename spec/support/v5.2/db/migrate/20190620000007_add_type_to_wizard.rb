# typed: true
class AddTypeToWizard < ActiveRecord::Migration[5.2]
  def change
    add_column :wizards, :type, :string, null: false, default: 'Wizard'
  end
end
