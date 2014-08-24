class Account < ActiveRecord::Base
  has_many :owners
  has_many :pets
  has_many :emergency_contacts

  attr_accessor :password, :email_confirmation
  before_save :encrypt_password

  validates :password, presence: true, length: { in: 10..20 }, confirmation: true,
                       format: { with: /\A(?=(?:[^a-z]*[a-z]{4}))(?=(?:[^A-Z]*[A-Z]){2})(?=\D*\d)(?=\w*[!\$\.\?#@\^%&]+)/ }

  validates :password_confirmation, presence: true

  validates :email, presence: true, uniqueness: true,
                    format: { with: /.+@.+\.[a-z]{2,}/ }

  validates :email_confirmation, presence: true

  def self.authenticate(email, password)
    account = find_by_email(email)
    puts "the account email is: #{account.email}"
    puts "the account password is: #{account.password}"
    if account && account.password_hash == BCrypt::Engine.hash_secret(password, account.password_salt)
      account
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end