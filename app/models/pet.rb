class Pet < ActiveRecord::Base
  belongs_to :account
  validates :name, presence: true
  validates :kind, presence: true
  validates :health_history, presence: true
  validates :current_health, presence: true
end
