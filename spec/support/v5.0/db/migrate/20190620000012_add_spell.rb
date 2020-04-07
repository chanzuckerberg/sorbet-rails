# typed: false
class AddSpell < ActiveRecord::Migration[5.0]
  def change
    create_table :spells do |t|
      t.string :name
    end
  end
end
