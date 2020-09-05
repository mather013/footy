class UsersController < ApplicationController
  before_action :require_login
  before_action :load_common

  def index
    @week = Week.find(params[:week_id])
    redirect_to root_url if @week.status == 'Open'

    @fixtures = @week.fixtures.sorted
    @bonuses = bonuses_for_user_and_week unless @week.status == 'pending'
  end

  def show_lm
    @rounds = LmRound.sorted
  end

  def show_lp
    @rounds = LpRound.sorted
  end

  def fat_round_bets
    @round = FatRound.find(params['fat_round_id'])
    @bets = @round.bets.where(user_id: user_id)
  end

  def user_round_bets_gg
    @round = Rounds::GoalsGaloreRound.find(round_id)
    @fixtures = @round.week.fixtures.sorted
    @bets = Bets::GoalsGaloreBet.for_user_and_round(user_id, round_id)
  end

  private

  def load_common
    @user = user
    @current_user = current_user
  end

  def user
    User.find(user_id)
  end

  def user_id
    params['user_id'].to_i
  end

  def round_id
    params['round_id'].to_i
  end

  def bonuses_for_user_and_week
    point = @user.points.where(week_id: @week.id).first
    point.present? ? point.bonuses : []
  end

end
