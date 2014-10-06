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

class Reservation < MailForm::Base
  attribute :name, :validate => true
  attribute :email, :validate => /.+@.+\.[a-z]{2,}/
  attribute :message
  attribute :nickname, :captcha => true

  # Declare the e-mail headers. It accepts anything the
  # mail method in ActionMailer accepts.
  def headers
    {
      :subject => "Reservation Request",
      :to => "sean.a.dickey5@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end

class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params[:contact])
    @reservation.request = request
    if @reservation.deliver
      flash.now[:notice] = "Thank you for making a reservation. We'll review your request and be in touch soon! Please note that SWS works on a first-come, first-served basis and your request does not guarantee your reservation. Reservations are only added to our sit schedule once they have been approved and a sit deposit of 50% has been received."
    else
      flash.now[:error] = "We're sorry but something went wrong and the message can't be sent."
      render :new
    end
  end
end

class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string    :name
      t.date      :depart_date
      t.string    :depart_time
      t.integer   :depart_num_visits
      t.string    :overnight_on_depart
      t.date      :return_date
      t.string    :return_time
      t.integer   :return_num_visits
      t.integer   :num_std_visits_between
      t.text      :custom_std_visit_schedule
      t.text      :std_visit_instructions
      t.string    :overnights_between
      t.text      :overnight_instructions
      t.string    :leaving_country
      t.string    :visit_updates_method

      t.timestamps
    end
  end
end

