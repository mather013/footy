module Marking
  class GoalsGaloreMarking < MarkSingleBets

    def initialize
      @name = 'Goals Galore'
      @bet_class = Bets::GoalsGaloreBet
      @round_class = Rounds::GoalsGaloreRound
      @point_class = Points::GoalsGalorePoint
      @new_round_resource = RakeTaskResources::AddGoalsGaloreRound
    end

    def perform
      log('Marking')
      pending_bets.each do |bet|
        user_points = find_or_create_user_point(bet)
        value = calc_points(bet)

        award_points(user_points, value) unless value.nil?
        apply_result(bet, value) unless value.nil?
      end
      add_new_round if new_round_required?
    end

    private

    def find_or_create_user_point(bet)
      point_class.for_user_and_round(bet.user.id, bet.round_id).first ||
          point_class.create(user_id: bet.user.id, value: 0, round_id: bet.round_id)
    end

    def calc_points(bet)
      results = round_results(bet.round)
      return points_for_win if results[:winning_selections].include?(bet.selection)
      return points_for_loss if results[:losing_selections].include?(bet.selection)
      nil
    end

    def pending_bets
      bet_class.pending
    end

    def award_points(user_points, value)
      user_points.add_points(value)
    end

    def apply_result(bet, points)
      points == points_for_win ? bet.set_won : bet.set_lost
    end

    def points_for_win
      10
    end

    def points_for_loss
      -15
    end

  end
end
