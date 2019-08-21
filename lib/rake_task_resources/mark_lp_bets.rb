module RakeTaskResources
  class MarkLpBets
    class << self

      def perform
        puts 'marking last man standing (Player)'

        users_with_bets.each do |user|
          points = calculate_points(user)
          award_points(user, points)
        end
        add_new_round if new_round_required?
      end

      private

      def users_with_bets
        User.all.joins(:lp_bets)
      end

      def calculate_points(user)
        user.lp_bets.each.inject(0) { |points, bet| points += bet.correct? ? 1 : 0 }
      end

      def award_points(user, points)
        user.lp_point ? user.lp_point.update_attributes(value: points) : user.create_lp_point(value: points)
      end

      def add_new_round
        RakeTaskResources::AddLpRound.perform
      end

      def new_round_required?
        LpRound.last.week.id < Week.current.id
      end

    end
  end
end
