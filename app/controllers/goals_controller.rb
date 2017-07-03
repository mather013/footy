class GoalsController < ApplicationController
  before_action :require_login

  def index
    @goals = Goal.all_player_grouped_total_ordered
  end

end
