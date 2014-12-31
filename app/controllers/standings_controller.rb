class StandingsController < ApplicationController
  before_filter :require_login

  def index
    @standings = Standing.sorted
  end

end
