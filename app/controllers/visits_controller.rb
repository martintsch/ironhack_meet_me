class VisitsController < ApplicationController
  def index
    @location = Location.find(params[:location_id])
    @visits = @location.visits_in_month_of_year(today.month, today.year)
  end

  def show
  end

  private

  def today
    Date.today
  end
end
