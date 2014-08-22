class InfoController < ApplicationController
  before_filter :require_login

  def index
    @users = User.order('username')
    @user = current_user
  end

end
