class CompetitionsController < ApplicationController

  before_filter :require_login

  def index
    @competitions = Competition.sorted
  end

  def show
    @competition = Competition.find(params[:id])
    @fixtures = @competition.fixtures
  end


end
