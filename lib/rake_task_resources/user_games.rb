module RakeTaskResources
  class UserGames
    class << self

      def perform args
        game = Game.find(args[:game_id])
        (args[:usernames].split ' ').each do |username|
          user = User.find_by_username(username)
          user.games << game if user.present?
        end
      end

    end
  end
end
