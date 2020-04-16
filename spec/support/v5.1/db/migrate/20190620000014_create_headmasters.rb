# typed: false
class CreateHeadmasters < ActiveRecord::Migration[5.1]
  def change
    create_table :headmasters do |t|
      t.references :school
      t.references :wizard
    end
  end
end
