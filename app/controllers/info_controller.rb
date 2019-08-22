class InfoController < ApplicationController
  before_action :require_login

  def index
    @users = User.order('username')
    @user = current_user
    @week_current = Week.current
    @round_current = LmRound.current
    @lp_round_current = LpRound.current
  end

end
