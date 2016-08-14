class PointsController < ApplicationController
  before_filter :require_login

  def index
    @current_user = current_user
    @game = game
    @total_points = Point.total_points
  end

  def show
    @current_user = current_user
    @game = game
    @week = Week.find(params[:week_id])
    @points = @week.points.sorted
  end

  private
  def game
    Game.find_by_name('Footy Forecast')
  end

end
