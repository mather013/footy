module Jobs
  module Syncing
    class SyncFixtures

      def perform
        return if Fixture.requiring_sync.blank?

        weeks_to_update = []

        fixtures_from_feed.each do |feed_fixture|
          home_team = Team.find_by_external_id(feed_fixture.home_team_id)
          away_team = Team.find_by_external_id(feed_fixture.away_team_id)
          fixture_name = "#{home_team.abbreviation.upcase}-#{away_team.abbreviation.upcase}" if home_team && away_team
          fixture = Fixture.find_by(name: fixture_name) if fixture_name

          if fixture.present? && fixture.external_id.nil?
            fixture.update_attributes(kickoff: feed_fixture.kickoff,
                                      status: feed_fixture.status,
                                      external_id: feed_fixture.id)


            weeks_to_update << fixture.week
          end
        end

        weeks_to_update.uniq.each do |week|
          week.update_attributes(close_date: week.fixtures.order('kickoff asc').first.kickoff)
        end
      end

      private

      def fixtures_from_feed
        n = ENVIRONMENT_CONFIG['days_in_advance_to_sync_fixtures']
        from_date = DateTime.now # Date.parse('2018-08-10')
        to_date = n.days.from_now # Date.parse('2018-08-12')
        Feed::FixturesController.new.get_fixtures_between(from_date, to_date)
      end

    end
  end
end
