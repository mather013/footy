class FaBetsController < ApplicationController
  before_filter :require_login

  def index
    @bets = FaBet.find_all_by_user_id(current_user)
  end

end