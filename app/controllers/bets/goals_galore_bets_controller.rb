module Bets
  class GoalsGaloreBetsController < ApplicationController
    before_action :require_login

    def index
      @round = Rounds::GoalsGaloreRound.find(round_id)
      @fixtures = @round.week.fixtures.sorted
      @bet = Bets::GoalsGaloreBet.new
      @bets = user_bets_for_round
    end

    def create
      Bets::GoalsGaloreBetsCreator.new(user_id, round_id, chosen_selections).perform

      redirect_to goals_galore_rounds_path(round_id)
    end

    private

    def round_id
      params['round_id']
    end

    def user_id
      current_user.id
    end

    def chosen_selections
      params['selections'].present? ? params['selections'].map(&:to_i) : []
    end

    def user_bets_for_round
      Bets::GoalsGaloreBet.for_user_and_round(user_id, round_id)
    end

  end
end
