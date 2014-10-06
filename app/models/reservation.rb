class Reservation < ActiveRecord::Base
  belongs_to :account

  attr_accessor :name, :depart_date, :depart_time,
  :depart_num_visits, :overnight_on_depart, :return_date,
  :return_time, :return_num_visits, :num_std_visits_between,
  :custom_std_visit_schedule, :std_visit_instructions,
  :overnights_between, :overnight_instructions, :leaving_country,
  :visit_updates_method

  validates :name, presence: true
  validates :depart_date, presence: true
  validates :depart_time, presence: true
  validates :depart_num_visits, presence: true
  validates :overnight_on_depart, presence: true
  validates :return_date, presence: true
  validates :return_time, presence: true
  validates :return_num_visits, presence: true
  validates :num_std_visits_between, presence: true
  validates :custom_std_visit_schedule, presence: true
  validates :std_visit_instructions, presence: true
  validates :overnights_between, presence: true
  validates :overnight_instructions, presence: true
  validates :leaving_country, presence: true
  validates :visit_updates_method, presence: true

  validate :depart_date_cannot_be_in_past

  def depart_date_cannot_be_in_past
    if !depart_date.blank? and depart_date < Date.today
      errors.add(:depart_date, "Your departure date can't be in the past")
    end
  end
end
