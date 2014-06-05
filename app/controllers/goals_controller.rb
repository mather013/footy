class GoalsController < ApplicationController
  before_filter :require_login

  def index
    @goals = Goal.find(:all, :select => 'player_id, count(*) as count', :group => 'player_id', :order => 'count DESC' )
  end

end
