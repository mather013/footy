class FatRoundsController < ApplicationController
  before_action :require_login

  def index
    @rounds = FatRound.sorted
  end

end
