require 'rails_helper'

describe Account do

  it "is valid with a valid email and password" do
    account = Account.new(email: 'test@tester.com',
      password: 'ccccCC1!!!',
      email_confirmation: 'tester@tester.com',
      password_confirmation: 'ccccCC1!!!')
    expect(account).to be_valid
  end

  it "is invalid without an email" do
    expect(Account.new(email: nil)).to_not be_valid
  end

  it "is invalid without a password" do
    expect(Account.new(password: nil)).to_not be_valid
  end

  it "is invalid with a duplicate email address" do
    Account.create(email: 'test@tester.com',
      password: 'ccccCC1!!!',
      email_confirmation: 'tester@tester.com',
      password_confirmation: 'ccccCC1!!!')
    account = Account.create(email: 'test@tester.com',
      password: 'aaaaAA1!!!',
      email_confirmation: 'tester@tester.com',
      password_confirmation: 'aaaaAA1!!!')
    expect(account).to have(1).error_on(:email)
  end
end