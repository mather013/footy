class FatRoundsController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
    @rounds = FatRound.sorted
  end

end
