module RakeTaskResources
  class MarkLmBets
    class << self
      def perform
        puts "marking last man"
        User.all.each do |user|
          lm_bets = Bets::LmsBet.find_all_by_user_id(user.id)
          if lm_bets.present?
            points = mark_last_man lm_bets
            award_points user, points
          end
        end
        add_new_round if Rounds::LmsRound.last.week.id < Week.current.id
      end

      private

      def mark_last_man lm_bets
        points = 0
        lm_bets.each { |lm_bet| points +=1 unless lm_bet.result == 'L' || lm_bet.result == 'D' }
        points
      end

      def award_points user, points
        user.lm_point.present? ? user.lm_point.update_attributes(value: points) : Points::LmsPoint.create(user_id: user.id, value: points)
      end

      def add_new_round
        RakeTaskResources::AddLmRound.perform
      end

    end
  end
end
