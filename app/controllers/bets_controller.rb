class BetsController < ApplicationController
  before_filter :require_login

  def new
    load_fixture_and_choices
    @bet = Bet.new
  end

  def create
    #binding.pry
    #bet = Bet.new(:fixture_id => params['bet']['fixture_id'], :user_id => current_user.id, :value => params['bet']['value'])
    #if bet.save!
    #  redirect_to fixtures_path(bet.fixture.week.id)
    #end
    bet = Bet.new(:fixture_id => params['fixture_id'], :user_id => current_user.id, :value => params['bet_value'])
    if bet.save!
      redirect_to fixtures_path(bet.fixture.week.id)
    end
  end

  def edit
    load_fixture_and_choices
    @bet = Bet.find(:all, :conditions => ["fixture_id = ? AND user_id = ?", params['fixture_id'], current_user.id])
  end

  def update
    bet= Bet.find(:all, :conditions => ["fixture_id = ? AND user_id = ?", params['fixture_id'], current_user.id]).first
    if bet.update_attributes(:value => params['bet']['value'])
      redirect_to fixtures_path(bet.fixture.week.id)
    end
  end

  private

  def load_fixture_and_choices
    @fixture = Fixture.find(params["fixture_id"])
    @choices = @fixture.choices
  end

end
