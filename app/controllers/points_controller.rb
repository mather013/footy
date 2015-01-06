class PointsController < ApplicationController
  before_filter :require_login

  def index
    @current_user = current_user
    @game = game
    #@total_points=Point.select("user_id, sum(value) as value").group("user_id").order("value DESC")
    @total_points = Point.find(:all, :select => 'user_id, count(*) as count, sum(value) as value', :group => 'user_id', :order => 'value DESC' )
  end

  def show
    @game = game
    @week = Week.find(params[:week_id])
    @points = Point.sorted.find_all_by_week_id(params[:week_id])
  end

  private
  def game
    Game.find_by_name('Footy Forecast')
  end

end
