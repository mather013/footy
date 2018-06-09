class FaPointsController < ApplicationController
  before_action :require_login

  def index
    @current_user = current_user
    @game = game
    @total_points = total_points
  end

  private
  def game
    Game.find_by_name('5 Alive')
  end

  def total_points
    # FaPoint.total_points

    user_ids = users_of_similar_community.map(&:id)
    @total_points = FaPoint.total_points_for_user_ids(user_ids)
  end

  def users_of_similar_community
    User.where(community_id: @current_user.community_id)
  end

end
