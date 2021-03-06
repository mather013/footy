class GbPointsController < ApplicationController
  before_action :require_login

  def index
    @round = GbRound.first
    @points = GbPoint.sorted
    @current_user = current_user
  end

  def show
    @point = GbPoint.find_by_team_id(params['id'])
    @team = @point.team
    @fixtures = @team.fixtures_from(GbRound.first.week.close_date)
  end

  def info

  end

end
