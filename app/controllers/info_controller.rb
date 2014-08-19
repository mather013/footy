class InfoController < ApplicationController
  before_filter :require_login

  def index
    @users = User.all
    @user = current_user
  end

end
