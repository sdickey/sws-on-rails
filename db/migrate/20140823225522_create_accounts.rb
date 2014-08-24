class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :password_hash
      t.string :password_salt
      t.string :email

      t.timestamps
    end
  end
end
