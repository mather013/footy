class FaBetsController < ApplicationController
  before_filter :require_login

  def index
    load_common
  end

  def new
    load_players
    @bet = FaBet.new
  end

  def create
    @bet = FaBet.new(user_id: current_user.id, player_id: params['player_id'])
    success = @bet.save!
    Services::AnalyticsService.publish(:bet_create, params_for_analytics) if success
    load_common
    render action: "index"
  end

  def edit
    load_players
    @bet = FaBet.where('id = ? and user_id = ?', params['id'], current_user.id).first
  end

  def update
    @bet = FaBet.where('id = ? and user_id = ?', params['id'], current_user.id).first
    success = @bet.update_attributes(player_id: params['player_id'])
    Services::AnalyticsService.publish(:bet_change, params_for_analytics) if success
    load_common
    render action: "index"
  end

  private

  def load_common
    @competition_started = Week.find(1).close_date < DateTime.now
    @bets = current_user.fa_bets.sorted
  end

  def load_players
    @players = Player.team_and_surname_order
  end

  def params_for_analytics
    {game: 'five_alive', username: current_user.username}
  end

end
