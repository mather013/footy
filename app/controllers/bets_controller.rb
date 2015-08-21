class BetsController < ApplicationController
  before_filter :require_login
  before_filter :fix_params, :only => [:create, :update]

  def new
    load_fixture_and_choices
    @bet = Bet.new
  end

  def create
    bet = Bet.new(fixture_id: params['fixture_id'], user_id: current_user.id, value: params['bet_value'])
    bet.save!
    redirect_to fixtures_path(bet.fixture.week.id)
  end

  def edit
    load_fixture_and_choices
    @bet = Bet.find(:all, :conditions => ['fixture_id = ? AND user_id = ?', params['fixture_id'], current_user.id]).first
  end

  def update
    Keen.publish(:bet_change, { username: current_user.username,
                                game: 'hda',
                                environment: Rails.env }) if Rails.env.production?

    bet = Bet.find(params['id'])
    bet.update_attributes(value: params['bet_value'])
    redirect_to fixtures_path(bet.fixture.week.id)
  end

  private

  def load_fixture_and_choices
    @fixture = Fixture.find(params['fixture_id'])
    @choices = @fixture.choices
  end

end

private

def fix_params
  unless TOGGLES_CONFIG['bet_type_hda']
    params.merge!({bet_value: params['home_score'] + ' - ' + params['away_score']})
  end
end
