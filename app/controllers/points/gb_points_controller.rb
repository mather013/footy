class GbPointsController < ApplicationController
  before_filter :require_login

  def index
    @round = Rounds::GbRound.first
    @points = Points::GbPoint.sorted
    @current_user = current_user
  end

  def show
    @point = Points::GbPoint.find_by_team_id(params['id'])
    @team = @point.team
    @fixtures = @team.fixtures_from(Rounds::GbRound.first.week.close_date)
  end

  def info

  end

end
