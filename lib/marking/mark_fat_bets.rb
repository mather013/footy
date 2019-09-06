module Marking
  class MarkFatBets
    class << self
      def perform(week_id = nil)

        round = week_id.nil? ? FatRound.latest : FatRound.find_by(week_id: week_id)
        return if round.nil?

        puts "marking 5 alive bets (#{round.description})"
        puts '================================'

        User.all.each do |user|
          bets = round.bets.where(user_id: user.id)
          if bets.present?

            results_hash = calculate_results(bets)

            points = results_hash[:points]
            additional_info = results_hash[:additional_info].join(',')

            record_points(round, user, points, additional_info)
          end
        end
      end

      private

      def record_points(round, user, points, additional_info)
        round_points_user = round.points.find_by(user_id: user.id)
        round_points_user.present? ? round_points_user.update_attributes(value: points, additional_info: additional_info) : round.points.create(user_id: user.id, value: points, additional_info: additional_info)
      end

      def calculate_results(bets)
        results = {points: 0, additional_info: []}
        bets.each do |bet|
          case bet.correct?
            when false
              results[:additional_info] << 'L'
            when nil
              results[:additional_info] << '-'
            when true
              results[:points] += 1
              results[:additional_info] << 'W'
          end
        end
        results
      end

    end
  end
end
