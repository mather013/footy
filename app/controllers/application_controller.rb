class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :log_current_request

  def log_current_request
    #Rails.logger.info("%-25s visited  %s" % [current_user.password,request.fullpath]) if current_user.present?
  end

  def current_user
    @user ||= User.find_by_id(cookies[:user_id]) if cookies[:user_id]
  end

  def require_login
    redirect_to root_url unless current_user
  end
end
