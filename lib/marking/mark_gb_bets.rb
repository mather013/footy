module Marking
  class MarkGbBets
    class << self

      MAX_VALUE = 11

      def perform
        puts "marking goal buster" unless Rails.env.test?

        hash = {}
        (1..Team.count).to_a.each { |team_id| hash[team_id] = 0 }

        fixtures.each do |fixture|
          if fixture.finished? && fixture.score.present?
            hash[fixture.home_team_id] += fixture.score.home unless (hash[fixture.home_team_id] + fixture.score.home) > MAX_VALUE
            hash[fixture.away_team_id] += fixture.score.away unless (hash[fixture.away_team_id] + fixture.score.away) > MAX_VALUE
          end
        end

        hash.each do |team_id, goals|
          event = goals > 0 ? last_goal_event(Team.find(team_id)) : nil
          minute = event.present? ? event.minute : nil
          GbPoint.find_by_team_id(team_id).update_attributes(value: goals, minute: minute)
        end
      end

      private

      def fixtures
        Fixture.where('kickoff >= ?',GbRound.first.week.close_date).order('kickoff asc')
      end

      def last_goal_event team
        #team.events.where(event_type:['goal','owngoal']).order('id desc').first
        #team.events.where('event_type in (?) and created_at >= ?', ['goal','owngoal'],weeks.first.close_date).order('id desc').first
        nil
      end

    end
  end
end
