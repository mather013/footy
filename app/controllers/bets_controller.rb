class BetsController < ApplicationController
  before_filter :require_login

  def new
    @fixture = Fixture.find(params["fixture_id"])
    @bet = Bet.new
  end

  def create
    bet = Bet.new(:fixture_id => params['bet']['fixture_id'], :user_id => current_user.id, :value => params['bet']['value'])
    if bet.save!
      load_week
      redirect_to week_path(@week.id)
    end
  end

  def edit
    @fixture = Fixture.find(params["fixture_id"])
    @bet = Bet.find(:all, :conditions => ["fixture_id = ? AND user_id = ?", params['fixture_id'], current_user.id])
  end

  def update
    bet= Bet.find(:all, :conditions => ["fixture_id = ? AND user_id = ?", params['fixture_id'], current_user.id]).first
    if bet.update_attributes(:value => params['bet']['value'])
      load_week
      redirect_to week_path(@week.id)
    end
  end

  private

  def load_week
    fixture = Fixture.find(params['bet']['fixture_id'])
    @week = Week.find(fixture.week_id)
  end

end
