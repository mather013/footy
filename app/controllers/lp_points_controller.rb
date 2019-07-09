class LpPointsController < ApplicationController
  before_action :require_login

  def index
    @game = game
    @max_round = LpRound.current
    @total_points = LpPoint.select('user_id, value').order('value DESC')
  end

  private
  def game
    Game.find_by_name('Last Player Standing')
  end

end
