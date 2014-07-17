class VisitsController < ApplicationController
  def index
    @location = Location.find(params[:location_id])
    @visits = @location.visits_in_month_of_year(today.month, today.year)
  end

  def show
    @location = Location.find(params[:location_id])
    @visit = Visit.find params[:id]
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

  def edit
    @location = Location.find(params[:location_id])
    @visit = Visit.find(params[:id])
  end

  def update
    @location = Location.find(params[:location_id])
    @visit = Visit.find params[:id]
    @visit.update_attributes visit_params

    if @visit.save
      redirect_to action: 'show', controller: 'visits', location_id: @location.id
    else
      render 'edit'
    end
  end

  def destroy
    @visit = Visit.find params[:id]
    if @visit.destroy
      redirect_to action: 'index', controller: 'visits', location_id: params[:location_id]
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
