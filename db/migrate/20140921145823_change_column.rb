class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :pets, :birth_month, :integer
  end
end
