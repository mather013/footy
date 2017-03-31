module RakeTaskResources
  class ResetLm
    class << self
      def perform week_id, rollover=false
        Points::LmsPoint.delete_all
        Bets::LmsBet.delete_all
        Rounds::LmsRound.delete_all
        Rounds::LmsRound.find_or_create_by_id(id: 1, week_id: week_id)
        remove_lms_game_from_all_users unless rollover
      end

      private

      def remove_lms_game_from_all_users
        lms_game = Game.find_by_name('Last Man Standing')
        User.all.each { |user| user.games.delete(lms_game) }
      end

    end
  end
end
