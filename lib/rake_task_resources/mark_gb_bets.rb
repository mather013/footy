module RakeTaskResources
  class MarkGbBets
    class << self

      MAX_VALUE = 11

      def perform
        puts "marking goal buster" unless Rails.env.test?

        hash = {}
        (1..Team.count).to_a.each { |team_id| hash[team_id] = 0 }

        weeks.each do |week|
          week.fixtures.each do |fixture|
            if fixture.score.present?
              hash[fixture.home_team_id] += fixture.score.home unless (hash[fixture.home_team_id] + fixture.score.home) > MAX_VALUE
              hash[fixture.away_team_id] += fixture.score.away unless (hash[fixture.away_team_id] + fixture.score.away) > MAX_VALUE
            end
          end
        end

        hash.each { |k, v| GbPoint.find_by_team_id(k).update_attributes(value: v) }
      end

      def weeks
        Week.where('id >= ?', GbRound.first.starting_week_id)
      end

    end
  end
end
