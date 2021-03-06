class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string     :first_name
      t.string     :last_name
      t.string     :email
      t.string     :number_and_street
      t.string     :unit
      t.string     :city
      t.string     :state
      t.integer     :zip
      t.string     :home_phone
      t.string     :work_phone
      t.string     :cell_phone
      t.belongs_to :account
      t.timestamps
    end
  end
end
