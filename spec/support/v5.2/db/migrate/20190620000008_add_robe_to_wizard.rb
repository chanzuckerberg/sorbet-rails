# typed: true
class AddRobeToWizard < ActiveRecord::Migration[5.2]
  def change
    create_table :robes do |t|
      t.references :wizard
    end
  end
end
