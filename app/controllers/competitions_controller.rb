class CompetitionsController < ApplicationController

  before_filter :require_login

  def index
    @competitions = Competition.sorted
  end

  def show
    @fixtures = Competition.find(params[:id]).fixtures
  end


end
