module Jobs
  class SyncScores

    def perform(force=false)
      return if force==false && Fixture.recently_finished.blank?

      scores_recorded = false
      fixtures_from_feed.each do |feed_fixture|
        if feed_fixture.finished?
          record_scores feed_fixture
          record_events feed_fixture
          scores_recorded = true
        end
      end

      if scores_recorded
        week = required_week
        run_marking(week)
        week.maybe_mark_complete
      end

    end

    private

    def record_scores feed_fixture
      fixture = Fixture.find_by_external_id(feed_fixture.id)
      if fixture.score.present?
        fixture.score.update_attributes(home: feed_fixture.home_team_goals, away: feed_fixture.away_team_goals)
      else
        fixture.create_score(home: feed_fixture.home_team_goals, away: feed_fixture.away_team_goals)
      end
    end

    def record_events feed_fixture
      fixture = Fixture.find_by_external_id(feed_fixture.id)
      feed_fixture.events.each do |event|
        Event.find_or_initialize_by_external_id(event[:event_id]).update_attributes(fixture_id: fixture.id,
                                                                                    event_type: event[:event_type],
                                                                                    player_name: event[:event_player],
                                                                                    team: event[:event_team],
                                                                                    minute: event[:event_minute])
      end
    end

    def required_week
      Week.find((Week.current.id)-1)
    end

    def fixtures_from_feed
      Feed::FixturesController.new.get_fixtures_for Date.today
    end

    def run_marking week
      RakeTaskResources::MarkWeek.perform week.id
      RakeTaskResources::MarkLmBets.perform
    end

  end
end
