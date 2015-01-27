class FixturesController < ApplicationController
  before_filter :require_login

  def index
    @week = Week.find(params[:week_id])
    @fixtures = @week.fixtures.order('kickoff asc, name asc')
    @user = current_user
  end

end
