module Jobs
  class SyncScores

    def perform
      dates = Fixture.recent_not_finished.collect(&:kickoff).map(&:to_date).uniq
      weeks_to_mark = []

      dates.each do |date|
        fixtures_from_feed(date).each do |feed_fixture|
          if [Fixture::Status::IN_PLAY, Fixture::Status::FINISHED].include?(feed_fixture.status)
            fixture = Fixture.find_by_external_id(feed_fixture.id)
            fixture.update_attributes(status: feed_fixture.status)
            fixture.record_score({home: feed_fixture.home_team_goals, away: feed_fixture.away_team_goals})
            #record_events(feed_fixture.events, fixture)
            weeks_to_mark << fixture.week if fixture.status == Fixture::Status::FINISHED
          end
        end
      end
      weeks_to_mark.uniq
    end

    private

    def fixtures_from_feed date
      Feed::FixturesController.new.get_fixtures_for(date)
    end

    def record_events(feed_fixture_events, fixture)
      feed_fixture_events.each do |feed_event|
        event = fixture.events.find_or_initialize_by_external_id(feed_event.id)
        team_id = feed_event.team == 'localteam' ? fixture.home_team_id : fixture.away_team_id
        event.update_attributes(feed_event.to_savable_hash.merge({team_id: team_id}))
      end
    end
  end
end
