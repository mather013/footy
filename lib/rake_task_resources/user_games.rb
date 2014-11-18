module RakeTaskResources
  class UserGames
    class << self

      def perform args
        games      = Game.where(id: args[:game_ids].split("-"))
        user       = User.find_by_username(args[:username])
        user.games = games
        user.save
      end

    end
  end
end
