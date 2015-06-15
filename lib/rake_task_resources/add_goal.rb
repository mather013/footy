module RakeTaskResources
  class AddGoal
    class << self
      def perform args
        score = Fixture.find_by_name(args[:fixture_name]).score
        player = Player.where(forename: args[:forename].gsub("_", " "), surname: args[:surname].gsub("_", " ")).first

        args[:amount].to_i.times { score.goals.create(player_id: player.id) } if score.present? && player.present?
      end
    end
  end
end
