# typed: false
class AddSpellsSpellBooks < ActiveRecord::Migration[5.0]
  def change
    create_join_table :spells, :spell_books do |t|
      t.index [:spell_id, :spell_book_id]
    end
  end
end
