class LmsRoundsController < ApplicationController
  before_filter :require_login

  def index
    @rounds = Rounds::LmsRound.sorted
    @user = current_user
  end

  def info

  end

end
