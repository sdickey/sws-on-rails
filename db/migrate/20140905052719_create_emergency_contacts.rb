class CreateEmergencyContacts < ActiveRecord::Migration
  def change
    create_table :emergency_contacts do |t|
      t.string :emerg_first_name
      t.string :emerg_last_name
      t.string :emerg_hphone
      t.string :emerg_wphone
      t.string :emerg_cphone
      t.belongs_to :account
      t.timestamps
    end
  end
end
