module RakeTaskResources
  class MarkFatBets
    class << self
      def perform

        round = FatRound.latest
        return if round.nil?

        puts "marking 5 alive bets (#{round.description})"
        puts '================================'

        User.all.each do |user|
          bets = round.bets.where(user_id: user.id)
          points = calculate_points(bets)
          record_points(round, user, points)
        end
      end

      private

      def calculate_points(bets)
        points = 0
        bets.each { |bet| points += 1 if bet.correct? }
        points
      end

      def record_points(round, user, points)
        round_points_user = round.points.find_by(user_id: user.id)
        round_points_user.present? ? round_points_user.update_attributes(value: points) : round.points.create(user_id: user.id, value: points)
      end

    end
  end
end
