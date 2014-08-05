class LmBetsController < ApplicationController
  before_filter :require_login

  def new
    load_details
    @bet = LmBet.new
  end

  def create
    bet = LmBet.new(:lm_round_id => params['lm_bet']['lm_round'], :user_id => current_user.id, :team_id => params['lm_bet']['team_id'])
    bet.save
    redirect_to lm_rounds_path
  end

  def edit
    load_details
    @bet = LmBet.find(:all, :conditions => ["lm_round_id = ? AND user_id = ?", params[:lm_round_id], current_user.id]).first
  end

  def update
    bet= LmBet.find(params['id'])
    bet.update_attributes(:team_id => params['lm_bet']['team_id'])
    redirect_to lm_rounds_path
  end

  private

  def load_details
    @lm_round  = LmRound.find(params[:lm_round_id])
    @week      = @lm_round.week
    @fixtures  = @lm_round.week.fixtures
    all_teams  = Team.all_for_choices

    teams_used = []
    LmBet.find(:all, :conditions => ["lm_round_id <> ? AND user_id = ?", params[:lm_round_id], current_user.id]).each do |bet|
      teams_used << Team.find(bet.team_id)
    end

    teams_used_ids = []
    teams_used.each { |team| teams_used_ids << [team.name, team.id] }

    @choices = all_teams - teams_used_ids

  end

end
