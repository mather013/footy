class PointsController < ApplicationController
  before_filter :require_login

  def index
    @current_user = current_user
    @game = game
    @total_points = total_points
  end

  def show
    @current_user = current_user
    @game = game
    @week = Week.find(params[:week_id])
    @points = @week.points.sorted_with_bonus
  end

  private
  def game
    Game.find_by_name('Footy Forecast')
  end

  def total_points
    TOGGLES_CONFIG['bonus_points'] ? Point.total_points_with_bonus : Point.total_points
  end
end
