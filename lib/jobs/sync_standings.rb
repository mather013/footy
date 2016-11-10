module Jobs
  class SyncStandings

    def perform
      i=0
      Standing.delete_all
      standings_from_feed.each do |feed_team|
        team = Team.find_by_external_id(feed_team.id)
        Standing.create(id: i+=1,
                        team_id: team.id,
                        position: feed_team.position,
                        form: feed_team.form ||= team.calc_form.join(''),
                        points: feed_team.points,
                        form_score: feed_team.form_score,
                        played: feed_team.played,
                        goal_difference: feed_team.goals[:difference]) if team.present?
      end
    end

    private

    def standings_from_feed
      Feed::StandingsController.new.get_standings
    end

  end
end
