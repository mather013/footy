module Rounds
  class StreakRoundsController < ApplicationController
    before_action :require_login

    def index
      @rounds = Rounds::StreakRound.sorted
      @user = current_user
      @bets = @user.streak_bets
      @points = @user.streak_points.sorted

      # render status: 200, json: {rounds: @rounds, bets: @bets}.to_json
    end

    def info
    end

  end
end
