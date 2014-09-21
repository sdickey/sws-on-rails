class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column_default :accounts, :keys_on_file, 0
  end
end
