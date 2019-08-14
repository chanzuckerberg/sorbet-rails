# typed: true
class CreateSpellBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :spell_books do |t|
      t.string :name
      t.references :wizard
    end
  end
end
