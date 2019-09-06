module Marking
  class MarkFaBets
    class << self

      def perform
        puts "marking 5 alive bets"
        puts "===================="

        users.each do |user|
          fa_bets = user.fa_bets

          if fa_bets.present?
            goals = 0
            fa_bets.each { |bet| goals += bet.player.goals.count }

            record_points(user, goals)
            puts "#{user.name} goals: #{goals}"
          end
        end
      end

      private

      def users
        User.all
      end

      def record_points(user, points)
        user.fa_point.present? ? user.fa_point.update_attributes(value: points) : FaPoint.create(user_id: user.id, value: points)
      end

    end
  end
end
