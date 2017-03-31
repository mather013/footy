class FixturesController < ApplicationController
  before_filter :require_login

  def index
    @week = Week.find(params[:week_id])
    @fixtures = @week.fixtures.sorted
    @bonuses = bonuses_for_user_and_week unless @week.status == 'pending'
    @user = current_user
  end

  def hda_bets_info
    @week = Week.find(params[:week_id])
    @fixture = Fixture.find(params[:fixture_id])
  end

  private

  def bonuses_for_user_and_week
    point = @user.hda_points.where(week_id: @week.id).first
    point.present? ? point.bonuses : []
  end

end
