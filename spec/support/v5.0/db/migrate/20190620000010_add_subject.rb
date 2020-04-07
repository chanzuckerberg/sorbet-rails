# typed: false
class AddSubject < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :name
    end
  end
end
