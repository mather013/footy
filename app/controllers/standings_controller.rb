class StandingsController < ApplicationController
  before_action :require_login

  def index
    Standing.refresh unless Standing.up_to_date?
    @standings = Standing.sorted
  end

end
