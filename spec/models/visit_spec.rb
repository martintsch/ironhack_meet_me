require 'rails_helper'

RSpec.describe Visit, :type => :model do
  it "belongs to a location" do
    location = Location.create name: "Home", city: "Barcelona"
    visit = location.visits.create user_name: "Martin"

    expect(visit.location).to eq(location)
  end

  context "creation" do
    it "validates from_date for proper format" do
      location = Location.create name: "Home", city: "Barcelona"

      visit = location.visits.create user_name: "Martin",
                                     to_date: Time.now + 1.hour
      expect(visit.valid?).to eq false

      visit.from_date = Time.now
      expect(visit.valid?).to eq true
    end

    it "validates to_date for proper format" do
      location = Location.create name: "Home", city: "Barcelona"

      visit = location.visits.create user_name: "Martin",
                                     from_date: Time.now
      expect(visit.valid?).to eq false

      visit.to_date = Time.now  + 1.hour
      expect(visit.valid?).to eq true
    end

    it "validates user_name for proper format" do
      location = Location.create name: "Home", city: "Barcelona"

      visit = location.visits.create to_date: Time.now  + 1.hour,
                                     from_date: Time.now
      expect(visit.valid?).to eq false

      visit.user_name = "123as "
      expect(visit.valid?).to eq false

      visit.user_name = "Martin"
      expect(visit.valid?).to eq true
    end

    it "validates location presence" do
      location = Location.create name: "Home", city: "Barcelona"

      visit = location.visits.create to_date: Time.now  + 1.hour,
                                     from_date: Time.now,
                                     user_name: "Martin"
      expect(visit.valid?).to eq true

      visit.location_id = nil
      expect(visit.valid?).to eq false
    end
  end
end
