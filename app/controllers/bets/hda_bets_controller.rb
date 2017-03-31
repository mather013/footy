class HdaBetsController < ApplicationController
  before_filter :require_login
  before_filter :fix_params, :only => [:create, :update]

  def new
    load_fixture_and_choices
    @bet = Bets::HdaBet.new
  end

  def create
    bet = Bets::HdaBet.new(fixture_id: params['fixture_id'], user_id: current_user.id, value: params['bet_value'])
    success = bet.save!
    Services::AnalyticsService.publish(:bet_create, params_for_analytics) if success
    redirect_to fixtures_path(bet.fixture.week.id)
  end

  def edit
    load_fixture_and_choices
    @bet = Bets::HdaBet.find(:all, :conditions => ['fixture_id = ? AND user_id = ?', params['fixture_id'], current_user.id]).first
  end

  def update
    bet = Bets::HdaBet.find(params['id'])
    success = bet.update_attributes(value: params['bet_value'])
    Services::AnalyticsService.publish(:bet_change, params_for_analytics) if success
    redirect_to fixtures_path(bet.fixture.week.id)
  end

  def index
    redirect_to weeks_path
  end

  def show
    bet = Bets::HdaBet.find(params['id'])
    redirect_to fixtures_path(bet.fixture.week.id)
  end

  private

  def load_fixture_and_choices
    @fixture = Fixture.find(params['fixture_id'])
    @choices = @fixture.choices
    if TOGGLES_CONFIG['form_for_bets']
      @home_team_form = @fixture.home_team.results.last(5).join
      @away_team_form = @fixture.away_team.results.last(5).join
    end
  end

end

private

def params_for_analytics
  {game: 'hda', username: current_user.username}
end

def fix_params
  unless TOGGLES_CONFIG['bet_type_hda']
    params.merge!({bet_value: params['home_score'] + ' - ' + params['away_score']})
  end
end
