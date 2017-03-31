class LmsBetsController < ApplicationController
  before_filter :require_login

  def new
    @bet = Bets::LmsBet.new
    load_details
  end

  def create
    bet_params = {lm_round_id: params['lm_bet']['lm_round'], user_id: current_user.id, team_id: params['lm_bet']['team_id']}
    success = Bets::LmsBet.create(bet_params)
    Services::AnalyticsService.publish(:bet_create, params_for_analytics) if success
    redirect_to lm_rounds_path
  end

  def edit
    @bet = Bets::LmsBet.find(:all, :conditions => ['lm_round_id = ? AND user_id = ?', params[:lm_round_id], current_user.id]).first
    load_details
  end

  def update
    success = Bets::LmsBet.find(params['id']).update_attributes(team_id: params['lm_bet']['team_id'])
    Services::AnalyticsService.publish(:bet_change, params_for_analytics) if success
    redirect_to lm_rounds_path
  end

  private

  def load_details
    @lm_round = Rounds::LmsRound.find(params[:lm_round_id])
    @fixtures = @lm_round.week.fixtures_strict

    permitted_teams = []
    @lm_round.week.fixtures_strict.each do |fixture|
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
