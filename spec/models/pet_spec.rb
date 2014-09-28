describe Pet do
  it "is invalid without a name" do
    expect(Pet.new(name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without a kind" do
    expect(Pet.new(kind: nil)).to have(1).errors_on(:kind)
  end

  it "is invalid without a health history" do
    expect(Pet.new(health_history: nil)).to have(1).errors_on(:health_history)
  end

  it "is invalid without a current health description" do
    expect(Pet.new(current_health: nil)).to have(1).errors_on(:current_health)
  end

end