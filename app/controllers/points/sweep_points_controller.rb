class SweepPointsController < ApplicationController
  before_filter :require_login

  def index
    @points = SweepPoint.sorted - [Team.find_by_name('TBA').sweep_point]
    @current_user = current_user
    @game = Game.find(5)
  end

end
