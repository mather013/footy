class WeeksController < ApplicationController

  before_filter :require_login

  def index
    @weeks = Week.sorted
  end

  def show
    @week = Week.find(params[:id])
    @fixtures = @week.fixtures
  end


end
