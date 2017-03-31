module RakeTaskResources
  class ResetGoalBuster
    class << self

      def perform starting_week_id
        delete_data
        Rounds::GbRound.create(starting_week_id: starting_week_id)

        Team.all.each do |team|
          Points::GbPoint.create(team_id: team.id, value: 0)
        end
      end

      private

      def delete_data
        Rounds::GbRound.delete_all
        Points::GbPoint.delete_all
        Bets::GbBet.delete_all
      end

    end
  end
end
