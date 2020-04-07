# typed: true
class AddSpell < ActiveRecord::Migration[5.2]
  def change
    create_table :spells do |t|
      t.string :name
    end
  end
end
