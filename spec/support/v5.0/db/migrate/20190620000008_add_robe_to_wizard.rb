# typed: false
class AddRobeToWizard < ActiveRecord::Migration[5.0]
  def change
    create_table :robes do |t|
      t.references :wizard
    end
  end
end
