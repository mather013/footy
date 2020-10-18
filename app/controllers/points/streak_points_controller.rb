module Points
  class StreakPointsController < ApplicationController
    before_action :require_login

    def index
      @user = current_user

      streak_users = Bets::StreakBet.all.map(&:user).uniq
      totals_unsorted = streak_users.each.inject([]) { |array, u| array << {user: u}.merge(u.streak_info) }

      @totals = totals_unsorted.sort_by { |k| k['best'] }

      # render status: 200, json: {points: @points, user_id: @user.id}.to_json
    end

    def show
      @user = current_user
      @round = Rounds::StreakRound.find_by(id: round_id)
      @points = @round ? Points::StreakPoint.for_round(round_id).sorted : []
    end

    private

    def round_id
      params['round_id']
    end

  end
end
