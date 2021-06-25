# typed: true
class CreateHeadmasters < ActiveRecord::Migration[6.0]
  def change
    create_table :headmasters do |t|
      t.references :school
      t.references :wizard
    end
  end
end
