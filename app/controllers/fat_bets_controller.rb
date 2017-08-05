class FatBetsController < ApplicationController
  before_action :require_login

  def index
    @bets = current_user.fat_bets.sorted #by fat_round_id
    @round = @bets.first.fat_round
  end

end
