class AddKeysOnFileToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :keys_on_file, :integer
  end
end
