module Points
  class GoalsGalorePointsController < ApplicationController
    before_action :require_login

    def index
      @user = current_user
      @points = points_array

      # render status: 200, json: {points: @points, user_id: @user.id}.to_json
    end

    def show
      @user = current_user
      @round = Rounds::GoalsGaloreRound.find_by(id: params['round_id'])
      @points = @round ? Points::GoalsGalorePoint.for_round(params['round_id']).sorted : []
    end

    private

    # TODO MOVE AND REFACTOR
    def points_array
      hash = Rounds::GoalsGaloreRound.all.each.inject({}) do |h, r|
        Points::GoalsGalorePoint.for_round(r.id).all.each do |p|
          h[p.user_id] = 0 unless h[p.user_id]
          h[p.user_id] += p.value > 0 ? p.value : 0
        end; h
      end.sort_by { |k, v| v }.reverse.to_h

      hash.each.inject([]) do |a, k|
        user = User.find(k[0].to_i)
        a << {user_id: user.id, username: user.name, total: k[1]}
      end

    end

  end
end
