module RakeTaskResources
  class MarkLmBets
    class << self
      def perform
        puts "marking last man bets"
        puts "===================="
        User.all.each do |user|
          lm_bets = LmBet.find_all_by_user_id(user.id)
          if lm_bets.present?
            points = mark_last_man lm_bets
            award_points user, points
          end
        end
      end

      private

      def mark_last_man lm_bets
        points = 0
        lm_bets.each do |lm_bet|
          points +=1 unless lm_bet.result == 'L' || lm_bet.result == 'D'
        end
        points
      end

      def award_points user, points
        user.lm_point.present? ? user.lm_point.update_attributes(value: points) : LmPoint.create(user_id: user.id, value: points)
        puts "#{user.name} points: #{points}"
      end

    end
  end
end
