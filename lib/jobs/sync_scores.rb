module Jobs
  class SyncScores

    def perform(force=false)
      return if force==false && Fixture.recently_finished.blank?

      scores_recorded = false
      fixtures_from_feed.each do |feed_fixture|
        if feed_fixture.finished?
          @fixture = Fixture.find_by_external_id(feed_fixture.id)
          @fixture.record_score({home: feed_fixture.home_team_goals, away: feed_fixture.away_team_goals})
          record_events feed_fixture.events
          scores_recorded = true
        end
      end

      if scores_recorded
        week = required_week
        run_marking(week)
        week.maybe_mark_complete
        sync_standings
      end

    end

    private

    def record_events events
      events.each do |event|
        Event.find_or_initialize_by_external_id(event[:event_id]).update_attributes(fixture_id: @fixture.id,
                                                                                    event_type: event[:event_type],
                                                                                    player_name: event[:event_player],
                                                                                    team: event[:event_team],
                                                                                    minute: event[:event_minute])
      end
    end

    def fixtures_from_feed
      Feed::FixturesController.new.get_fixtures_for Date.today
    end

    def required_week
      Week.find((Week.current.id)-1)
    end

    def run_marking week
      RakeTaskResources::MarkWeek.perform week.id
      RakeTaskResources::MarkLmBets.perform
      RakeTaskResources::RefreshPositions.perform
    end

    def sync_standings
      Jobs::SyncStandings.new.perform
    end

  end
end
