class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string    :name
      t.string    :kind
      t.string    :breed
      t.integer   :age
      t.date      :birthmonth
      t.text      :healthhistory
      t.text      :currenthealth
      t.string    :medname
      t.text      :medadminister
      t.string    :meddose
      t.text      :medfrequency
      t.text      :behavior

      t.timestamps
    end
  end
end

class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :username
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :home_phone
      t.string :work_phone
      t.string :cell_phone
      t.string :emerg_first_name
      t.string :emerg_last_name
      t.string :emerg_hphone
      t.string :emerg_wphone
      t.string :emerg_cphone

      t.timestamps
    end
  end
end
