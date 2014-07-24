class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  rescue ActiveRecord::RecordNotFound
    render 'not_found'
  end
end
