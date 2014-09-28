class Owner < ActiveRecord::Base
  belongs_to :account
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: /.+@.+\.[a-z]{2,}/ }

  validates :number_and_street, presence: true
  validates :zip, presence: true, length: { is: 5 }
  validates :home_phone, format: { with: /\(\d{3}\)\s{1}\d{3}\s{1}-\s{1}\d{4}/}, :allow_blank => true
  validates :work_phone, format: { with: /\(\d{3}\)\s{1}\d{3}\s{1}-\s{1}\d{4}/}, :allow_blank => true
  validates :cell_phone, format: { with: /\(\d{3}\)\s{1}\d{3}\s{1}-\s{1}\d{4}/}, :allow_blank => true
  validate :phone_present?

  def phone_present?
    if [:home_phone, :work_phone, :cell_phone].all? { |attr| self[attr].blank? }
      errors.add :base,"We need at least one contact number"
    end
  end
end
