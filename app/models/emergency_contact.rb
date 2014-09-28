class EmergencyContact < ActiveRecord::Base
  belongs_to :account
  validates :emerg_first_name, presence: true
  validates :emerg_last_name, presence: true
  validates :emerg_hphone, format: { with: /\(\d{3}\)\s{1}\d{3}\s{1}-\s{1}\d{4}/ }, :allow_blank => true
  validates :emerg_wphone, format: { with: /\(\d{3}\)\s{1}\d{3}\s{1}-\s{1}\d{4}/ }, :allow_blank => true
  validates :emerg_cphone, format: { with: /\(\d{3}\)\s{1}\d{3}\s{1}-\s{1}\d{4}/ }, :allow_blank => true

  validate :phone_present?

  def phone_present?
    if [:emerg_hphone, :emerg_wphone, :emerg_cphone].all? { |attr| self[attr].blank? }
      errors.add :base, "We need at least one contact number"
    end
  end
end
