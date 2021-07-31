# typed: true
class AddSpell < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|
      t.string :name
    end
  end
end
