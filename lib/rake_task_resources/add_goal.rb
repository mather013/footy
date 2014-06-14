module RakeTaskResources
  class AddGoal
    class << self
      def perform args
        player = Player.find_by_name(args[:player_name].gsub("_"," "))
        score  = Fixture.find_by_name(args[:fixture_name]).score
        goals = args[:amount].to_i
        goals.times do
          score.goals << Goal.new(player_id: player.id)
        end
      end
    end
  end
end
