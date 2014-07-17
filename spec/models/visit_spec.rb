require 'rails_helper'

RSpec.describe Visit, :type => :model do
  it "belongs to a location" do
    location = Location.create name: "Home", city: "Barcelona"
    visit = location.visits.create user_name: "Martin"

    expect(visit.location).to eq(location)
  end
end
