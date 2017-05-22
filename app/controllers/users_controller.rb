class UsersController < ApplicationController
  before_action :require_login

  def index
    @week = Week.find(params[:week_id])
    redirect_to root_url if @week.status == 'Open'

    @fixtures = @week.fixtures.sorted
    @view_user = User.find(params[:user_id])

    @bonuses = bonuses_for_user_and_week unless @week.status == 'pending'
  end

  def show
    @rounds = LmRound.sorted
    @view_user = User.find(params[:user_id])
  end

  private

  def bonuses_for_user_and_week
    point = @view_user.points.where(week_id: @week.id).first
    point.present? ? point.bonuses : []
  end

end
