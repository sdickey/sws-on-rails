class Reservation < ActiveRecord::Base
  belongs_to :account

  attr_accessor :depart_date, :return_date

  validates :name, presence: true
  validates :depart_date, presence: true
  validates :depart_time, presence: true
  validates :depart_num_visits, presence: true
  validates :overnight_on_depart, presence: true
  validates :return_date, presence: true
  validates :return_time, presence: true
  validates :return_num_visits, presence: true
  validates :num_std_visits_between, presence: true
  validates :overnights_between, presence: true
  validates :leaving_country, presence: true
  validates :visit_updates_method, presence: true

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
end
