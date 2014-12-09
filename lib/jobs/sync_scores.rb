module Jobs
  class SyncScores

    def perform(force=false)
      return if force==false && Fixture.recently_finished.blank?

      scores_recorded = false
      fixtures_from_feed.each do |feed_fixture|
        if feed_fixture.finished?
          fixture = Fixture.find_by_external_id(feed_fixture.id)
          if fixture.score.present?
            fixture.score.update_attributes(home: feed_fixture.home_team_goals, away: feed_fixture.away_team_goals)
          else
            fixture.create_score(home: feed_fixture.home_team_goals, away: feed_fixture.away_team_goals)
          end
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
