class FatPointsController < ApplicationController
  before_action :require_login

  def show
    @current_user = current_user
    @round = FatRound.find(params['fat_round_id'])
    @points = @round.points.select('user_id, value, additional_info').order('value DESC')
  end

  def index
    @current_user = current_user
    @total_points = FatPoint.total_points
    @all_bets = FatBet.all
  end

end
