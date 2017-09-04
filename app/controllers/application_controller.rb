class ApplicationController < ActionController::Base
  include ::ActionController::Cookies
  include ActionController::MimeResponds
  protect_from_forgery

  def current_user
    @user ||= User.find_by_id(cookies[:user_id]) if cookies[:user_id]
  end

  def require_login
    redirect_to root_url unless current_user
  end
end
