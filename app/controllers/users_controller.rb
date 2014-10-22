class UsersController < ApplicationController
  before_filter :require_login

  def index
    @week = Week.find(params[:week_id])
    redirect_to root_url if @week.status == 'Open'

    @fixtures = @week.fixtures
    @view_user = User.find(params[:user_id])
  end

  def show
    @rounds = LmRound.sorted
    @view_user = User.find(params[:user_id])
  end

end
