class BetsController < ApplicationController
  before_filter :require_login

  def new
    @fixture = Fixture.find(params["fixture_id"])
    @bet = Bet.new
  end

  def create
    load_week
    bet = Bet.new(:fixture_id => params['bet']['fixture_id'], :user_id => current_user.id, :value => params['bet']['value'])
    if bet.save!
      redirect_to week_path(@week.id)
    end
  end

  private
  def load_week
    fixture = Fixture.find(params['bet']['fixture_id'])
    @week = Week.find(fixture.week_id)
  end

end
