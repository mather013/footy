module Jobs
  module Syncing
    class SyncFixturesRefresh

      def perform(args={})

        date = DateTime.parse(args[:date]) rescue nil

        weeks_to_update = []

        fixtures_from_feed(date).each do |feed_fixture|
          home_team = Team.find_by_external_id(feed_fixture.home_team_id)
          away_team = Team.find_by_external_id(feed_fixture.away_team_id)
          fixture_name = "#{home_team.abbreviation.upcase}-#{away_team.abbreviation.upcase}" if home_team && away_team
          fixture = Fixture.find_by(name: fixture_name) if fixture_name

          if fixture.present? && fixture.external_id.nil?
            fixture.update_attributes!(home_team_id: home_team.id,
                                       away_team_id: away_team.id,
                                       kickoff: feed_fixture.kickoff,
                                       status: feed_fixture.status,
                                       external_id: nil)
            weeks_to_update << fixture.week
          end
        end

        weeks_to_update.uniq.each do |week|
          week.update_attributes(close_date: week.fixtures.order('kickoff asc').first.kickoff)
        end
      end

      private

      def fixtures_from_feed(date)
        service = Feed::FixturesController.new
        date.nil? ? service.get_all_fixtures : service.get_fixtures_between(date, date)
      end

    end
  end
end
