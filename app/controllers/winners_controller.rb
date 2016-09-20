class WinnersController < ApplicationController
  before_filter :require_login

  def index
    @winners = Winner.order(:number)
    @weeks = Week.sorted
  end

end
