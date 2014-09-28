class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :pets, :birth_month, :string
    remove_column :owners, :address
    add_column :owners, :number_and_street, :string
    add_column :owners, :unit, :string
    add_column :owners, :city, :string
    add_column :owners, :state, :string
    add_column :owners, :zip, :integer
  end
end
