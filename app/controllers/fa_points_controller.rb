class FaPointsController < ApplicationController
  before_filter :require_login

  def index
    @total_points = FaPoint.find(:all, :select => 'user_id, value', :order => 'value DESC')
  end

end