class FaBetsController < ApplicationController
  before_filter :require_login

  def index
    @bets = current_user.fa_bets
  end

end