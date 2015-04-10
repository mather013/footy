module Jobs
  class SyncScoresOnly

    def perform(date=nil)
      date = (date.nil? ? Date.today : Date.parse(date))

      return if date.nil? && Fixture.recently_finished.blank?

      fixtures_from_feed(date).each do |feed_fixture|
        if feed_fixture.finished?
          fixture = Fixture.find_by_external_id(feed_fixture.id)
          fixture.record_score({home: feed_fixture.home_team_goals, away: feed_fixture.away_team_goals})
          record_events(feed_fixture.events, fixture)
        end
      end
    end

    private

    def record_events(feed_fixture_events, fixture)
      feed_fixture_events.each do |feed_event|
        event = fixture.events.find_or_initialize_by_external_id(feed_event[:event_id])
        event.update_attributes(event_type: feed_event[:event_type],
                                player_name: feed_event[:event_player],
                                team: feed_event[:event_team],
                                minute: feed_event[:event_minute])
      end
    end

    def fixtures_from_feed date
      Feed::FixturesController.new.get_fixtures_for date
    end
  end
end
