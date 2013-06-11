class SessionsController < ApplicationController

  def index
    redirect_to competitions_path if current_user
  end

  def new
    redirect_to competitions_path if current_user
  end

  def create
    user = User.find(:first,
                     :conditions => ["username = ? and password = ?",
                                     params[:user]['username'],
                                     params[:user]['password']])

    unless user.nil?
      cookies.permanent[:user_id] = user.id
    end

    redirect_to competitions_path
  end
end