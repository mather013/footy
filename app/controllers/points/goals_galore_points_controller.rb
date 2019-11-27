module Points
  class GoalsGalorePointsController < ApplicationController
    before_action :require_login

    def index
      @user = current_user
      @points = Points::GoalsGalorePoint.totals_sorted

      # render status: 200, json: {points: @points, user_id: @user.id}.to_json
    end

    def show
      @user = current_user
      @round = Rounds::GoalsGaloreRound.find_by(id: params['round_id'])
      @points = @round ? @round.points.sorted : []
    end

  end
end
