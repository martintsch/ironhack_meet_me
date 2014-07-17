class VisitsController < ApplicationController
  def index
    @location = Location.find(params[:location_id])
    @visits = @location.visits_in_month_of_year(today.month, today.year)
  end

  def show
  end

  def new
    @location = Location.find(params[:location_id])
    @visit = @location.visits.new
  end

  def create
    @location = Location.find(params[:location_id])
    @visit = @location.visits.new visit_params

    if @visit.save
      redirect_to action: 'index', controller: 'visits', location_id: @location.id
    else
      render 'new'
    end
  end

  private

  def visit_params
    params.require(:visit).permit(:user_name, :from_date, :to_date)
  end

  def today
    Date.today
  end
end
