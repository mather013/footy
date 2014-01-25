class PointsController < ApplicationController
  before_filter :require_login

  def index

  end

  def show
    @week = Week.find(params[:week_id])
    @points = Point.sorted.find_all_by_week_id(params[:week_id])
  end

end
