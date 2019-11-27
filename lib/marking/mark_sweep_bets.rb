module Marking
  class MarkSweepBets < MarkSingleBets
    class << self

      def perform
        puts "marking sweepstake" unless Rails.env.test?

        fixtures.each do |fixture|
          if fixture.finished? && fixture.score.present?
            teams = fixture.teams
            teams.delete(fixture.winning_team)
            losing_team = teams.first
            SweepPoint.find_by_team_id(losing_team.id).update_attributes(value: fixture.week_id)
          end
        end
      end

      private

      def knockout_rounds
        ENVIRONMENT_CONFIG["#{ENVIRONMENT_CONFIG['competition']}"]['knockout_rounds']
      end

      def fixtures
        Week.where('close_date < now() and id in (?)', knockout_rounds).map(&:fixtures).flatten
      end
    end
  end
end
