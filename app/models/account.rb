class Account < ActiveRecord::Base
  has_many :owners
  has_many :pets
  has_many :emergency_contacts

  attr_accessor :password

  validates :password, presence: true, length: { in: 10..20 }, confirmation: true,
                       format: { with: /\A(?=(?:[^a-z]*[a-z]{4}))(?=(?:[^A-Z]*[A-Z]){2})(?=\D*\d)(?=\w*[!\$\.\?#@\^%&]+)/ }

  validates :password_confirmation, presence: true

  validates :email, presence: true, uniqueness: true,
                    format: { with: /.+@.+\.[a-z]{2,}/ }

  validates :email_confirmation, presence: true
end
