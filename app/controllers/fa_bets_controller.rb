class FaBetsController < ApplicationController
  before_action :require_login

  def index
    load_common
    @top_tally = Goal.top_tally.count
  end

  def new
    @teams = Team.sorted
  end

  def create
    @bet = FaBet.new(user_id: current_user.id, player_id: params['player_id'])
    success = @bet.save
    Services::AnalyticsService.publish(:bet_create, params_for_analytics) if success
    load_common
    render action: "index"
  end

  def edit
    @bet = FaBet.where('id = ? and user_id = ?', params['id'], current_user.id).first
    @teams = Team.sorted
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
    open_period = ENVIRONMENT_CONFIG['round_open_period_in_days']
    week_one_close_date = Week.find(1).close_date
    @competition_started = week_one_close_date < Time.now || week_one_close_date > Time.now + (open_period.days*2)
    @bets = current_user.fa_bets.sorted
  end

  def load_players
    @players = Player.team_and_surname_order
  end

  def params_for_analytics
    {game: 'five_alive', username: current_user.username}
  end

end
