class GbPointsController < ApplicationController
  before_filter :require_login

  def index
    @round = GbRound.first
    @points = GbPoint.sorted
  end

  def info

  end

end
