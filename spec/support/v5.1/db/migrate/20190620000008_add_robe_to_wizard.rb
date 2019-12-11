# typed: false
class AddRobeToWizard < ActiveRecord::Migration[5.1]
  def change
    create_table :robes do |t|
      t.references :wizard
    end
  end
end
