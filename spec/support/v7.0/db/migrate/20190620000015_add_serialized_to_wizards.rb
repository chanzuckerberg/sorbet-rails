# typed: true
class AddSerializedToWizards < ActiveRecord::Migration[7.0]
  def change
    add_column :wizards, :owl_results, :text # Hash
    add_column :wizards, :newt_subjects, :text # generic
    add_column :wizards, :pets, :text # Array
    add_column :wizards, :patronus_characteristics, :text # serialized as JSON, but not a JSON column type
  end
end
