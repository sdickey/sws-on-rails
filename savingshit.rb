class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string    :name
      t.string    :kind
      t.string    :breed
      t.integer   :age
      t.date      :birth_month
      t.text      :health_history
      t.text      :current_health
      t.string    :med_name
      t.text      :med_administer
      t.string    :med_dose
      t.text      :med_frequency
      t.text      :behavior

      t.timestamps
    end
  end
end

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

      # add these to their own migration
      t.string :emerg_first_name
      t.string :emerg_last_name
      t.string :emerg_hphone
      t.string :emerg_wphone
      t.string :emerg_cphone

      t.timestamps
    end
  end
end
