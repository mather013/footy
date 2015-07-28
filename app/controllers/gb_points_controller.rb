class GbPointsController < ApplicationController
  before_filter :require_login

  def index
    @round = GbRound.first
    @points = GbPoint.sorted
    @current_user = current_user
  end

  def info

  end

end
