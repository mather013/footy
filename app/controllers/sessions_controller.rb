class SessionsController < ApplicationController

  def index
    redirect_to weeks_path if current_user
  end

  def new
    redirect_to weeks_path if current_user
  end

  def create
    user = User.find_by(username: params[:user]['username'],
                        password: params[:user]['password'])

    unless user.nil?
      cookies.permanent[:user_id] = user.id
    end

    redirect_to weeks_path
  end
end
