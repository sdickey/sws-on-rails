class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :home_phone
      t.string :work_phone
      t.string :cell_phone

      t.timestamps
    end
  end
end
