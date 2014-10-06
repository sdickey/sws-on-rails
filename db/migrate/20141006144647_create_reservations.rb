class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string    :name
      t.date      :depart_date
      t.time      :depart_time
      t.integer   :depart_num_visits
      t.string    :overnight_on_depart
      t.date      :return_date
      t.time      :return_time
      t.integer   :return_num_visits
      t.integer   :num_std_visits_between
      t.text      :custom_std_visit_schedule
      t.text      :std_visit_instructions
      t.string    :overnights_between
      t.text      :overnight_instructions
      t.string    :leaving_country
      t.string    :visit_updates_method
      t.belongs_to :account

      t.timestamps
    end
  end
end

