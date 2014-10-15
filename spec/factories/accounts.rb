FactoryGirl.define do
  factory :account do
    sequence(:email) { |n| "bilbobaggins@theshire.com"}
    sequence(:email_confirmation) { |n| "bilbobaggins@theshire.com"}
    password 'ccccCC1!!!'
    password_confirmation 'ccccCC1!!!'
  end
end