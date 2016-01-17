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

        hash.each do |k, v|
          event = v > 0 ? last_goal_event(Team.find(k)) : nil
          minute = event.present? ? event.minute : nil
          GbPoint.find_by_team_id(k).update_attributes(value: v, minute: minute)
        end
      end

      private

      def weeks
        Week.where('id >= ?', GbRound.first.starting_week_id).order('close_date asc')
      end

      def last_goal_event team
        team.events.where(event_type:['goal','owngoal']).order('id desc').first
      end

    end
  end
end
