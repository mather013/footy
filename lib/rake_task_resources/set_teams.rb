module RakeTaskResources
  class SetTeams
    class << self
      def perform args
        fixture = Fixture.find(args[:id].to_i)
        home_team = Team.find_by_abbreviation(args[:fixture_name][0..2].downcase)
        away_team = Team.find_by_abbreviation(args[:fixture_name][4..6].downcase)

        fixture.update_attributes(home_team_id: home_team.id, away_team_id: away_team.id)
      end
    end
  end
end
