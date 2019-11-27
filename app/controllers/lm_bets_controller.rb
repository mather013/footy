class LmBetsController < ApplicationController
  before_action :require_login

  def new
    @bet = LmBet.new
    load_details
  end

  def create
    bet_params = {round_id: params['lm_bet']['round'], user_id: current_user.id, selection: params['lm_bet']['selection']}
    success = LmBet.create(bet_params)
    Services::AnalyticsService.publish(:bet_create, params_for_analytics) if success
    redirect_to lm_rounds_path
  end

  def edit
    @bet = LmBet.find_by(round_id: params[:round_id], user_id: current_user.id)
    load_details
  end

  def update
    success = LmBet.find(params['id']).update_attributes(selection: params['lm_bet']['selection'])
    Services::AnalyticsService.publish(:bet_change, params_for_analytics) if success
    redirect_to lm_rounds_path
  end

  private

  def load_details
    @round = LmRound.find(params[:round_id])
    @fixtures = @round.week.fixtures_strict

    permitted_teams = []
    @round.week.fixtures_strict.each do |fixture|
      permitted_teams << fixture.home_team
      permitted_teams << fixture.away_team
    end

    teams_used = []
    User.find(current_user.id).lm_bets.each do |lm_bet|
      teams_used << lm_bet.team unless @bet.present? && @bet.team == lm_bet.team
    end

    @choices = []
    (permitted_teams - teams_used).each do |team|
      @choices << [team.name, team.id]
    end
    @choices.sort_by! { |i| i.first }
  end

  def params_for_analytics
    {game: 'lms', username: current_user.username}
  end

end
