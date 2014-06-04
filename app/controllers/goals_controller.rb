class GoalsController < ApplicationController
  before_filter :require_login

  def index
    #@goals = Goal.find(:all, :select => 'player_id, count(*) as count, sum(amount) as total', :group => 'player_id', :order => 'total DESC' )
    @goals = Goal.find(:all, :select => 'player_id, count(*) as count', :group => 'player_id', :order => 'count DESC' )
  end

end
