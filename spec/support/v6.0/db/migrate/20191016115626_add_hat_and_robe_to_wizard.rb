# typed: true
class AddHatAndRobeToWizard < ActiveRecord::Migration[6.0]
  def change
    create_table :hat do |t|
      t.references :wizard
    end

    create_table :robe do |t|
      t.references :wizard
    end
  end
end
