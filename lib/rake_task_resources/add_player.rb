module RakeTaskResources
  class AddPlayer
    class << self
      def perform args
        team = Team.find_by_abbreviation(args[:team_abbreviation].downcase)
        Player.create!(id: args[:id],
                       forename: args[:forename],
                       surname: args[:surname],
                       squad_number: args[:squad_number],
                       team_id: team.id)
      end
    end
  end
end
