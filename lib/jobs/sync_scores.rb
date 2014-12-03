module Jobs
  class SyncScores

    def perform(force=false)
      return if force==false && Fixture.recently_finished.blank?

      requires_marking = false
      fixtures_from_feed.each do |feed_fixture|
        if feed_fixture.finished?
          fixture = Fixture.find_by_external_id(feed_fixture.id)
          if fixture.score.present?
            fixture.score.update_attributes(home: feed_fixture.home_team_goals, away: feed_fixture.away_team_goals)
          else
            fixture.create_score(home: feed_fixture.home_team_goals, away: feed_fixture.away_team_goals)
          end
          requires_marking = true
        end
      end
      mark_games if requires_marking
    end

    private

    def fixtures_from_feed
      Feed::FixturesController.new.get_fixtures_for Date.today
    end

    def mark_games
      RakeTaskResources::MarkWeek.perform Week.current.id -1
      RakeTaskResources::MarkLmBets.perform
    end

  end
end
