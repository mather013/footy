class CompetitionsController < ApplicationController

  before_filter :require_login

  def index
    @competitions = Competition.sorted
  end
end
