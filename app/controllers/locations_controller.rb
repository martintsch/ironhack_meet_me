class LocationsController < ApplicationController
  def index
    @locations = Location.last_created(10)
  end
end
