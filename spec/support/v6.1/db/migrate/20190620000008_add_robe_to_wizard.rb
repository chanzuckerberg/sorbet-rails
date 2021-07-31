# typed: true
class AddRobeToWizard < ActiveRecord::Migration[6.0]
  def change
    create_table :robes do |t|
      t.references :wizard
    end
  end
end
