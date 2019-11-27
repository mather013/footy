class InfoController < ApplicationController
  before_action :require_login

  def index
    @playing_users = User.order(:username).select(&:plays?)
    @user = current_user
    @week_current = Week.current
  end

end
