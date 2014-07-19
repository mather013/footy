class LmPointsController < ApplicationController
  before_filter :require_login

  def index
    @max_round = LmRound.current
    @total_points = LmPoint.find(:all, :select => 'user_id, value', :order => 'value DESC')
  end

end
