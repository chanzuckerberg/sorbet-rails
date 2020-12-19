class AddSerializedToWizards < ActiveRecord::Migration[5.0]
  def change
    add_column :wizards, :owl_results, :text # Hash
    add_column :wizards, :pets, :text # Array
  end
end
