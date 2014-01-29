class PointsController < ApplicationController
  before_filter :require_login

  def index
    @total_points=Point.select("user_id, sum(value) as value").group("user_id").order("value DESC")
  end

  def show
    @week = Week.find(params[:week_id])
    @points = Point.sorted.find_all_by_week_id(params[:week_id])
  end

end
