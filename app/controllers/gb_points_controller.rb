class GbPointsController < ApplicationController
  before_filter :require_login

  def index
    @round = GbRound.first
    @points = GbPoint.sorted
    @current_user = current_user
  end

  def show
    @point = GbPoint.find(params['id'])
    @team = @point.team
    @fixtures = @team.fixtures_from(GbRound.first.week.close_date)
  end

  def info

  end

end
