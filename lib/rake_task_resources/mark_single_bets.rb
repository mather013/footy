module RakeTaskResources
  class MarkSingleBets
    class << self

      def perform
        print_output

        pending_bets.each do |bet|
          points = bet.correct? ? points_for_win : points_for_loss
          award_points(bet, points)
          apply_result(bet, points)
        end
        add_new_round if new_round_required?
      end

      private

      def pending_bets
        bet_class.pending
      end

      def award_points(bet, points)
        user_bet_point = find_or_create_user_point(bet)
        user_bet_point.add_points(points)
      end

      def apply_result(bet, points)
        points == points_for_win ? bet.set_won : bet.set_lost
      end

      def new_round_required?
        round_class.last.week.id < Week.current.id
      end

      def add_new_round
        new_round_resource.perform
      end

    end
  end
end
