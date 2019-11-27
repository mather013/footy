module Rounds
  class GoalsGaloreRoundsController < ApplicationController
    before_action :require_login

    def index
      @rounds = Rounds::GoalsGaloreRound.sorted
      @user = current_user
      @bets = @user.goals_galore_bets
      @points = @user.goals_galore_points.sorted

      # render status: 200, json: {rounds: @rounds, bets: @bets}.to_json
    end

    def info
    end

  end
end
