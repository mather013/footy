module Jobs
  class SyncScores

    def perform
      return if Fixture.recently_finished.blank?

      fixtures_from_feed.each do |feed_fixture|
        if feed_fixture.finished?
          fixture = Fixture.find_by_feed_id(feed_fixture.id)
          if fixture.score.present?
            fixture.score.update_attributes(home: feed_fixture.home_team_goals, away: feed_fixture.away_team_goals)
          else
            fixture.create_score(home: feed_fixture.home_team_goals, away: feed_fixture.away_team_goals)
          end
        end
      end
    end
  end

  private

  def fixtures_from_feed
    Feed::FixturesController.new.get_fixtures_for Date.today
  end

end
