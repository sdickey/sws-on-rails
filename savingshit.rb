class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string    :name
      t.string    :depart_date
      t.string    :depart_time
      t.integer   :depart_num_visits
      t.string    :overnight_on_depart
      t.string    :return_date
      t.string    :return_time
      t.integer   :return_num_visits
      t.integer   :num_std_visits_between
      t.text      :custom_std_visit_schedule
      t.text      :std_visit_instructions
      t.string    :overnights_between
      t.text      :overnight_instructions
      t.string    :leaving_country
      t.string    :visit_updates_method
      t.string    :availability_confirmed
      t.string    :deposit_confirmed
      t.belongs_to :account

      t.timestamps
    end
  end
end

class ChangeColumnDefaults < ActiveRecord::Migration
  def change
    change_column_default :accounts, :keys_on_file, 0
    change_column_default :reservations, :availability_confirmed, 'pending'
    change_column_default :reservations, :deposit_confirmed, 'no'
  end
end