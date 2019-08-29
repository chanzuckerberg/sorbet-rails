# typed: true
class CreateProfessor < ActiveRecord::Migration[5.2]
  def change
    create_table :professor do |t|
      t.integer :name
    end
  end
end
