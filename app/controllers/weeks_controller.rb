class WeeksController < ApplicationController
  before_filter :require_login

  def index
    @user = current_user
    @weeks = Week.sorted_open
  end

end
