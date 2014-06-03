module RakeTaskResources
  class AddGoal
    class << self
      def perform args
        player = Player.find_by_name(args[:player_name])
        score  = Fixture.find_by_name(args[:fixture_name]).score
        score.goals << Goal.new(player_id: player.id, amount: args[:goals])
      end
    end
  end
end
