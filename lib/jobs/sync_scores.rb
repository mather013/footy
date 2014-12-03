module Jobs
  class SyncScores

    def perform(force=false)
      #puts "========================="
      #puts "Running sync_scores job"

      fixtures_recently_finished = Fixture.recently_finished
      return if force==false && fixtures_recently_finished.blank?

      #puts "Fixtures expecting scores: #{fixtures_recently_finished.collect(&:name)}" unless force
      #puts "Fixtures for whole day" if force

      fixtures_from_feed.each do |feed_fixture|
        #puts "-------------------------"
        #puts "A. external_id: #{feed_fixture.id} received"
        if feed_fixture.finished?
          #puts "B. external_id: #{feed_fixture.id} finished"
          fixture = Fixture.find_by_external_id(feed_fixture.id)
          #puts "C. external_id: #{feed_fixture.id} #{fixture.name}"
          if fixture.score.present?
            #puts "D. external_id: #{feed_fixture.id} score updated"
            fixture.score.update_attributes(home: feed_fixture.home_team_goals, away: feed_fixture.away_team_goals)
          else
            #puts "D. external_id: #{feed_fixture.id} score created"
            fixture.create_score(home: feed_fixture.home_team_goals, away: feed_fixture.away_team_goals)
          end
        else
          #puts "B. external_id: #{feed_fixture.id} not finished"
        end
        #puts "-------------------------"
      end
      #puts "Completed sync_scores job"
      #puts "========================="
    end

    private

    def fixtures_from_feed
      Feed::FixturesController.new.get_fixtures_for Date.today
    end

  end
end
