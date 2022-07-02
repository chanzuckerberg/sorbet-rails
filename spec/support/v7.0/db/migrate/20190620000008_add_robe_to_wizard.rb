# typed: true
class AddRobeToWizard < ActiveRecord::Migration[7.0]
  def change
    create_table :robes do |t|
      t.references :wizard
    end
  end
end
