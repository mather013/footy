class LoginController < ApplicationController
  def index
    redirect_to competitions_path if current_user
  end

  def new
    user = User.find(:first, :conditions =>
        ["username = ? and password = ?", params[:user]['username'],params[:user]['password']])

    if user.nil?
      redirect_to root_url
    else
      cookies.permanent[:user_id] = User.find_by_username(user['username']).id
      redirect_to competitions_path
    end

  end
end
