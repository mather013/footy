class SweepBetsController < ApplicationController
  before_filter :require_login

  def index
    @bets = SweepBet.sorted
    @current_user = current_user
  end

  def new
    @bet = SweepBet.new
    @number_of_teams_available = number_of_teams_available
  end

  def create
    @bet = SweepBet.create(user_id: @user.id, team_id: Team.find_by_name('TBA').id)
    redirect_to sweep_bets_path
  end

  private

  def number_of_teams_available
    (Team.count - SweepBet.count) -1
  end

end
