# typed: true
class CreateSpellBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :spell_books do |t|
      t.string :name
      t.references :wizard, null: false
      t.integer :book_type, null: false, default: 0
    end
  end
end
