module RakeTaskResources
  class ResetLm
    class << self
      def perform week_id, rollover=false
        LmPoint.delete_all
        LmBet.delete_all
        LmRound.delete_all
        LmRound.create(id: 1, week_id: week_id)
        remove_lm_game_from_all_users unless rollover
      end

      private

      def remove_lm_game_from_all_users
        lms_game = Game.find_by_name('Last Man Standing')
        User.all.each { |user| user.games.delete(lms_game) }
      end

    end
  end
end
