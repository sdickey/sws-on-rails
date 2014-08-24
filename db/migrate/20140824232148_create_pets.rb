class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string     :name
      t.string     :kind
      t.string     :breed
      t.integer    :age
      t.date       :birth_month
      t.text       :health_history
      t.text       :current_health
      t.string     :med_name
      t.text       :med_administer
      t.string     :med_dose
      t.text       :med_frequency
      t.text       :behavior
      t.belongs_to :account
      t.timestamps
    end
  end
end
