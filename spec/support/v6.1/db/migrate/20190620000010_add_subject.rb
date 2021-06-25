# typed: true
class AddSubject < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :name
    end
  end
end
