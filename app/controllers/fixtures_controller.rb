class FixturesController < ApplicationController
  before_action :require_login

  def index
    @week = Week.find(params[:week_id])
    @fixtures = @week.fixtures.sorted
    @bonuses = bonuses_for_user_and_week unless @week.status == 'pending'
    @user = current_user
    @current_user = @user
  end

  def bets_info
    @week = Week.find(params[:week_id])
    @fixture = Fixture.find(params[:fixture_id])
  end

  private

  def bonuses_for_user_and_week
    point = @user.points.where(week_id: @week.id).first
    point.present? ? point.bonuses : []
  end

end
