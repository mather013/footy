class LpBetsController < ApplicationController
  before_action :require_login

  def new
    @bet = LpBet.new
    load_details
  end

  def create
    bet_params = {round_id: params['lp_round_id'], user_id: current_user.id, selection: params['player_id']}
    success = LpBet.create(bet_params).errors.empty?
    Services::AnalyticsService.publish(:bet_create, params_for_analytics) if success
    args = success ? {} : {error: 'message'}
    redirect_to lp_rounds_path args
  end

  def edit
    @bet = LpBet.find_by(round_id: params[:lp_round_id], user_id: current_user.id)
    load_details
  end

  def update
    success = LpBet.find(params['id']).update_attributes(selection: params['player_id'])
    Services::AnalyticsService.publish(:bet_change, params_for_analytics) if success
    args = success ? {} : {error: 'message'}
    redirect_to lp_rounds_path args
  end

  private

  def load_details
    @lp_round = LpRound.find(params[:lp_round_id])
    @teams = Team.sorted
    @fixtures = @lp_round.week.fixtures_strict

    # @selections_used = current_user.lp_bets.each.inject([]) do |selections_used, bet|
    #   selections_used << bet.player.id unless @bet.present? && @bet.selection == bet.player.id }
    # end
  end

  def params_for_analytics
    {game: 'lps', username: current_user.username}
  end

end
