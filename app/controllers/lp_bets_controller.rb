class LpBetsController < ApplicationController
  before_action :require_login

  def new
    @bet = LpBet.new
    load_details
  end

  def create
    bet_params = {lp_round_id: params['lp_round_id'], user_id: current_user.id, player_id: params['player_id']}
    success = LpBet.create(bet_params)
    Services::AnalyticsService.publish(:bet_create, params_for_analytics) if success
    redirect_to lp_rounds_path
  end

  def edit
    @bet = LpBet.find_by(lp_round_id: params[:lp_round_id], user_id: current_user.id)
    load_details
  end

  def update
    success = LpBet.find(params['id']).update_attributes(player_id: params['player_id'])
    Services::AnalyticsService.publish(:bet_change, params_for_analytics) if success
    redirect_to lp_rounds_path
  end

  private

  def load_details
    @lp_round = LpRound.find(params[:lp_round_id])
    @teams = Team.all
    @fixtures = @lp_round.week.fixtures_strict
  end

  def params_for_analytics
    {game: 'lps', username: current_user.username}
  end

end
