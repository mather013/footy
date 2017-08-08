class FatPointsController < ApplicationController
  before_action :require_login

  def index
    @current_user = current_user
    @round = FatRound.find(params['fat_round_id'])
    @points = @round.points.select('user_id, value').order('value DESC')
  end

end
