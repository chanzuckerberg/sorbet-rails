# typed: true
class AddTypeToWizard < ActiveRecord::Migration[6.0]
  def change
    add_column :wizards, :type, :string, null: false, default: 'Wizard'
  end
end
