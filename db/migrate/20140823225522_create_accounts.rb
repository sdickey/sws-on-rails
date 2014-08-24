class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :password_hash
      t.string :password_salt
      t.string :email
      t.references :owner
      t.references :pet
      t.references :emergency_contact
      t.timestamps
    end
  end
end
