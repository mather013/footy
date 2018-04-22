class FaPointsController < ApplicationController
  before_action :require_login

  def index
    @current_user = current_user
    @game = game
    @total_points = FaPoint.total_points
  end

  private
  def game
    Game.find_by_name('5 Alive')
  end

end
