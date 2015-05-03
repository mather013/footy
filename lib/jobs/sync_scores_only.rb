module Jobs
  class SyncScoresOnly

    def perform(date=nil)
      return [] if date.nil? && Fixture.recently_finished.blank?

      weeks_to_mark = []

      fixtures_from_feed(date).each do |feed_fixture|
        if feed_fixture.finished?
          fixture = Fixture.find_by_external_id(feed_fixture.id)
          fixture.record_score({home: feed_fixture.home_team_goals, away: feed_fixture.away_team_goals})
          record_events(feed_fixture.events, fixture)
          weeks_to_mark << fixture.week
        end
      end
      weeks_to_mark.uniq
    end

    private

    def fixtures_from_feed date
      date = (date.nil? ? Date.today : Date.parse(date))
      Feed::FixturesController.new.get_fixtures_for date
    end

    def record_events(feed_fixture_events, fixture)
      feed_fixture_events.each do |feed_event|
        event = fixture.events.find_or_initialize_by_external_id(feed_event.id)
        event.update_attributes(feed_event.to_savable_hash)
      end
    end
  end
end
