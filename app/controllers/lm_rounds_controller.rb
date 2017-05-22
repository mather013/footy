class LmRoundsController < ApplicationController
  before_action :require_login

  def index
    @rounds = LmRound.sorted
    @user = current_user
  end

  def info

  end

end
