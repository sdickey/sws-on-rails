class ChangeColumnDefaults < ActiveRecord::Migration
  def change
    change_column_default :accounts, :keys_on_file, 0
    change_column_default :reservations, :availability_confirmed, 'pending'
    change_column_default :reservations, :deposit_confirmed, 'no'
  end
end