class LmsPointsController < ApplicationController
  before_filter :require_login

  def index
    @game = game
    @max_round = Rounds::LmsRound.current
    @total_points = Points::LmsPoint.find(:all, :select => 'user_id, value', :order => 'value DESC')
  end

  private
  def game
    Game.find_by_name('Last Man Standing')
  end

end
