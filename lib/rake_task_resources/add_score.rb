module RakeTaskResources
  class AddScore
    class << self
      def perform args
        score_array = args[:score].split("-")
        home_goals  = score_array[0]
        away_goals  = score_array[1]

        fixture = Fixture.find_by_name(args[:fixture_name])
        score   = Score.new(fixture_id: fixture.id, home: home_goals, away: away_goals)
        fixture.update_attributes(status: Fixture::Status::FINISHED)
        score.save
      end
    end
  end
end
