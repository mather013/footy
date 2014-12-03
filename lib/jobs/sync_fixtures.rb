module Jobs
  class SyncFixtures

    def perform
      return if Fixture.requiring_sync.blank?

      fixtures_from_feed.each do |feed_fixture|
        home_team = Team.find_by_external_id(feed_fixture.home_team_id)
        away_team = Team.find_by_external_id(feed_fixture.away_team_id)
        fixture   = Fixture.find_by_name("#{home_team.abbreviation.upcase}-#{away_team.abbreviation.upcase}")

        fixture.update_attributes(external_id: feed_fixture.id, kickoff: feed_fixture.kickoff) if fixture.present? && fixture.external_id.nil?
      end
    end

    private

    def fixtures_from_feed
      n = ENVIRONMENT_CONFIG['days_in_advance_to_sync_fixtures']
      Feed::FixturesController.new.get_fixtures_between DateTime.now, n.days.from_now
    end

  end
end
