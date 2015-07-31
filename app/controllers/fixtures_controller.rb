class FixturesController < ApplicationController
  before_filter :require_login

  def index
    @week = Week.find(params[:week_id])
    @fixtures = @week.fixtures.sorted
    @user = current_user
  end

end
