# typed: true
class AddTypeToWizard < ActiveRecord::Migration[7.0]
  def change
    add_column :wizards, :type, :string, null: false, default: 'Wizard'
  end
end
