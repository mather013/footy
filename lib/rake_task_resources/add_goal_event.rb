module RakeTaskResources
  class AddGoalEvent
    class << self
      def perform args
        fixture = Fixture.find_by_name(args[:fixture_name])
        player_name = args[:forename].present? ? "#{args[:forename]}. #{args[:surname]}" : "#{args[:surname]}"
        team = args[:team] == fixture.name[0..2] ? 'localteam' : 'visitorteam'

        fixture.events.create(player_name: player_name, minute: args[:minute], event_type: 'goal', team: team)
      end
    end
  end
end
