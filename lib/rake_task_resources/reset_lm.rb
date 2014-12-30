module RakeTaskResources
  class ResetLm
    class << self
      def perform week_id
        LmPoint.delete_all
        LmBet.delete_all
        LmRound.delete_all
        LmRound.find_or_create_by_id(id: 1, week_id: week_id)
        remove_lm_game_from_all_users
      end

      private

      def remove_lm_game_from_all_users
        lm_game= Game.find(4)
        User.all.each do |user|
          user.games.delete(lm_game)
        end
      end

    end
  end
end
