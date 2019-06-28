class CreateSpellBooks < ActiveRecord::Migration["#{ENV['RAILS_VERSION']}" || "5.2"]
  def change
    create_table :spell_books do |t|
      t.string :name
      t.references :wizard
    end
  end
end
