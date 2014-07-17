require 'rails_helper'

RSpec.describe Location, :type => :model do
  it "finds the Location just like the find method" do
    location = Location.create name: "Martin"

    found_location = Location.find location.id
    iron_found_location = Location.iron_find location.id

    expect(found_location).to eq(iron_found_location)
  end
end
