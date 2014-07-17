require 'rails_helper'

RSpec.describe Location, :type => :model do
  it "finds the Location just like the find method" do
    location = Location.create name: "Home", city: "Barcelona"

    found_location = Location.find location.id
    iron_found_location = Location.iron_find location.id

    expect(found_location).to eq(iron_found_location)
  end

  it "returns visists from given month and year" do
    location = Location.create name: "Home", city: "Barcelona"
    today = Time.now
    location.visits.create user_name: "Martin", from_date: today, to_date: today + 7.hours
    location.visits.create user_name: "Martin", from_date: today, to_date: today + 1.month

    location_visits = location.visits_in_month_of_year(today.month, today.year)
    expect(location_visits.count).to eq(1)
  end

  it "validates name for proper format" do
    location = Location.new city: "Barcelona"
    expect(location.valid?).to eq false

    location.name = ""
    expect(location.valid?).to eq false

    location.name = "A123Home321"
    expect(location.valid?).to eq false

    name = ""; 31.times { name += "a" }
    location.name = name
    expect(location.valid?).to eq false

    location.name = "Home"
    expect(location.valid?).to eq true
  end

  it "validates city for proper format" do
    location = Location.new name: "Home"
    expect(location.valid?).to eq false

    location.city = "Barcelona"
     expect(location.valid?).to eq true
  end
end
