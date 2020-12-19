# typed: true
class AddSerializedToWizards < ActiveRecord::Migration[6.0]
  def change
    add_column :wizards, :owl_results, :text # Hash
    add_column :wizards, :pets, :text # Array
  end
end
