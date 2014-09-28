describe EmergencyContact do
  it "is invalid without a first name" do
    expect(EmergencyContact.new(emerg_first_name: nil)).to have(1).errors_on(:emerg_first_name)
  end

  it "is invalid without a last name" do
    expect(EmergencyContact.new(emerg_last_name: nil)).to have(1).errors_on(:emerg_last_name)
  end

  it "is invalid without at least one phone number" do
    contact = EmergencyContact.new(
      emerg_first_name: "Bilbo",
      emerg_last_name: "Baggins",
      emerg_hphone: nil,
      emerg_wphone: nil,
      emerg_cphone: nil)
    expect(contact).to_not be_valid
  end

  it "is invalid without a formatted phone number" do
    contact = EmergencyContact.new(
      emerg_first_name: "Bilbo",
      emerg_last_name: "Baggins",
      emerg_hphone: nil,
      emerg_wphone: "555 555 - 5555",
      emerg_cphone: nil)
    expect(contact).to_not be_valid
  end

  it "is valid with one phone number" do
    contact = EmergencyContact.new(
      emerg_first_name: "Bilbo",
      emerg_last_name: "Baggins",
      emerg_hphone: nil,
      emerg_wphone: "(555) 555 - 5555",
      emerg_cphone: nil)
    expect(contact).to be_valid
  end
end