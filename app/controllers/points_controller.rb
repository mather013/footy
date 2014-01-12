class PointsController < ApplicationController

  #before_filter :require_login

  def index
    @week = Week.find(params[:week_id])
    @points = Point.find_all_by_week_id(params[:week_id])
    #@points = Point.sorted
  end

end
