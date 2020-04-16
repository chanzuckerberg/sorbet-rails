# typed: true
class CreateHeadmasters < ActiveRecord::Migration[5.2]
  def change
    create_table :headmasters do |t|
      t.references :school
      t.references :wizard
    end
  end
end
