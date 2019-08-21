# typed: false
class CreateSpellBooks < ActiveRecord::Migration
  def change
    create_table :spell_books do |t|
      t.string :name
      t.references :wizard
      t.integer :book_type, null: false, default: 0
    end
  end
end
