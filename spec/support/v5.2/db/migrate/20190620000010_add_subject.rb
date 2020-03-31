# typed: true
class AddSubject < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name
    end
  end
end
