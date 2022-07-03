# typed: true
class AddSpell < ActiveRecord::Migration[7.0]
  def change
    create_table :spells do |t|
      t.string :name
    end
  end
end
