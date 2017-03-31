class GbBetsController < ApplicationController
  before_filter :require_login

  def new
    @round = Rounds::GbRound.first
    @bet = Bets::GbBet.new
    @available_choices_count = available_choices.count
  end

  def create
    @bet = Bets::GbBet.create(user_id: @user.id, team_id: available_choices.sample)
    redirect_to new_gb_bet_path unless @bet.valid?
  end

  private

  def available_choices
    Rounds::GbRound.available_choices
  end

end
