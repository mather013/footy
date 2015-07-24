module RakeTaskResources
  class MarkGbBets
    class << self
      def perform
        puts "marking goal buster bets"
        puts "===================="

        hash = {}
        (1..20).to_a.each { |team_id| hash[team_id] = 0 }

        Week.where('id >= ?', GbRound.first.starting_week_id).each do |week|
          week.fixtures.each do |fixture|
            if fixture.score.present?
              hash[fixture.home_team_id] += fixture.score.home
              hash[fixture.away_team_id] += fixture.score.away
            end
          end
        end

        hash.each { |k, v| GbPoint.find_by_team_id(k).update_attributes(value: v) }
      end
    end
  end
end
