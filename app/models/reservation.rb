class Reservation < ActiveRecord::Base
  belongs_to :account

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :depart_date, presence: true
  validates :depart_time, presence: true, format: { with: /\d{1,2}:\d{2}\s{1}(AM|PM)/} #too strict, change it!
  validates :return_date, presence: true
  validates :return_time, presence: true, format: {with: /\d{1,2}:\d{2}\s{1}(AM|PM)/} #too strict, change it!

  validate :depart_date_cannot_be_in_past
  validate :return_date_cannot_be_in_past
  validate :return_date_after_depart_date


  def depart_date_cannot_be_in_past
    if !depart_date.blank? and depart_date.to_date < Date.today
      errors.add(:depart_date, "can't be in the past")
    end
  end

  def return_date_cannot_be_in_past
    if !return_date.blank? and return_date.to_date < Date.today
      errors.add(:return_date, "can't be in the past")
    end
  end

  def return_date_after_depart_date
    if !return_date.blank? && !depart_date.blank? && return_date.to_date < depart_date.to_date
      errors.add(:return_date, "can't come before your departure date")
    end
  end

  ###########################################################################
  # the code below was a fix for running class methods as singleton methods #
  # in order to use delayed_job on clear_old_reservations.                  #
  # I'm not sure it works.                                                  #
  # Previously, these were both self.method_name methods                    #
  # with no weird class << self business                                    #
  ###########################################################################

  class << self

    def reservation_reminder_email
      Reservation.all.each do |reservation|
        if ( reservation.depart_date.to_date - Date.today == 8 )
          ReservationMailer.delay.reservation_reminder(reservation)
        end
      end
    end

    def clear_old_reservations
      Reservation.all.each do |reservation|
        if ( Date.today - reservation.depart_date.to_date == 1 )
          reservation.destroy
        end
      end
    end

    # always run as background job using delayed_job gem
    handle_asynchronously :clear_old_reservations
  end
end
