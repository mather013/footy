module Jobs
  class SyncScores

    def perform
      weeks_to_mark = []

      scores_from_feed_for(fixtures).each do |feed_fixture_with_score|
        if status_for_updates.include?(feed_fixture_with_score.status)
          fixture = Fixture.find_by_external_id(feed_fixture_with_score.id)
          fixture.update_attributes(status: feed_fixture_with_score.status)
          fixture.record_score({home: feed_fixture_with_score.home_team_goals, away: feed_fixture_with_score.away_team_goals})
          record_events(feed_fixture_with_score.events, fixture)
          weeks_to_mark << fixture.week if fixture.finished?
        end
      end
      weeks_to_mark.uniq
    end

    private

    def fixtures
      Fixture.recent_not_finished
    end

    def scores_from_feed_for(fixtures)
      Feed::FixturesController.new.get_feed_fixtures_with_score_for(fixtures)
    end

    def record_events(feed_fixture_events, fixture)
      feed_fixture_events.each do |feed_event|
        event = fixture.events.find_or_initialize_by(external_id: feed_event.id)
        team_id = feed_event.by_home_team? ? fixture.home_team_id : fixture.away_team_id
        event_hash = feed_event.to_savable_hash.merge({team_id: team_id})
        event.update_attributes(event_hash)
      end
    end

    def status_for_updates
      [Fixture::Status::IN_PLAY, Fixture::Status::HALFTIME, Fixture::Status::FINISHED]
    end

  end
end
