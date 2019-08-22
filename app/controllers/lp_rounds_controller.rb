class LpRoundsController < ApplicationController
  before_action :require_login

  def index
    @rounds = LpRound.sorted
    @user = current_user
    @error = params['error']
  end

end
