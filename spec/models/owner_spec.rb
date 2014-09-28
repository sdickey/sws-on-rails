require 'rails_helper'

describe Owner do
  it "is invalid without a first name" do
    expect(Owner.new(first_name: nil)).to have(1).errors_on(:first_name)
  end

  it "is invalid without a last name" do
    expect(Owner.new(last_name: nil)).to have(1).errors_on(:last_name)
  end

  it "is invalid without an email address" do
    expect(Owner.new(email: nil)).to have(2).errors_on(:email)
  end

  it "is invalid without a valid email address" do
    expect(Owner.new(email: "d@d")).to have(1).errors_on(:email)
  end

  it "is invalid without a street and number" do
    expect(Owner.new(number_and_street: "")).to have(1).errors_on(:number_and_street)
  end

  it "is valid with a all valid information" do
    owner = Owner.new(first_name: "Bilbo", last_name: "Baggins",
      email: "hobbit@theshire.com", number_and_street: "1234 Hill Road",
      zip: 95124, cell_phone: "(123) 456 - 7890")
    expect(owner).to be_valid
  end

  it "is invalid without a zip code" do
     owner = Owner.new(first_name: "Bilbo", last_name: "Baggins",
      email: "hobbit@theshire.com", number_and_street: "1234 Hill Road",
      zip: "")
     expect(owner).to_not be_valid
  end

  it "is invalid without a zip code exactly 5 digits long" do
    owner = Owner.new(first_name: "Bilbo", last_name: "Baggins",
      email: "hobbit@theshire.com", number_and_street: "1234 Hill Road",
      zip: 9512)
    expect(owner).to_not be_valid
  end

  it "is invalid without at least one phone number" do
    owner = Owner.new(first_name: "Bilbo", last_name: "Baggins",
      email: "hobbit@theshire.com", number_and_street: "1234 Hill Road",
      zip: 95124, home_phone: nil, work_phone: nil, cell_phone: nil)
    expect(owner).to_not be_valid
  end

  it "is invalid without a formatted phone number" do
    expect(Owner.new(cell_phone: "555-555-5555")).to have(1).errors_on(:cell_phone)
  end

  it "is valid with one phone number" do
    owner = Owner.new(first_name: "Bilbo", last_name: "Baggins",
      email: "hobbit@theshire.com", number_and_street: "1234 Hill Road",
      zip: 95124, home_phone: "(555) 555 - 5555", work_phone: nil, cell_phone: nil)
    expect(owner).to be_valid
  end
end