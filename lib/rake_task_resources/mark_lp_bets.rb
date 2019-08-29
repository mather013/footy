module RakeTaskResources
  class MarkLpBets < MarkSingleBets
    class << self

      POINTS_FOR_WIN = 1
      POINTS_FOR_LOSS = 0

      private

      def print_output
        puts 'Marking LMS 2'
      end

      def bet_class
        LpBet
      end

      def round_class
        LpRound
      end

      def new_round_resource
        RakeTaskResources::AddLpRound
      end

      def find_or_create_user_point(bet)
        bet.user.lp_point ||= bet.user.create_lp_point(value: 0)
      end

      def points_for_win
        POINTS_FOR_WIN
      end

      def points_for_loss
        POINTS_FOR_LOSS
      end

    end
  end
end
