module Jobs
  class SyncFixturesRefresh

    def perform
      weeks_to_update = []

      fixtures_from_feed.each do |feed_fixture|
        home_team = Team.find_by_external_id(feed_fixture.home_team_id)
        away_team = Team.find_by_external_id(feed_fixture.away_team_id)
        fixture = Fixture.find_by_name("#{home_team.abbreviation.upcase}-#{away_team.abbreviation.upcase}")

        if fixture.present?
          fixture.update_attributes!(home_team_id: home_team.id,
                                     away_team_id: away_team.id,
                                     kickoff: feed_fixture.kickoff,
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
      Feed::FixturesController.new.get_all_fixtures
    end

  end
end
