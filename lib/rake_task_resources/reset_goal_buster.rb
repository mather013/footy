module RakeTaskResources
  class ResetGoalBuster
    class << self

      def perform starting_week_id
        delete_data
        GbRound.create(starting_week_id: starting_week_id)

        Team.all.each do |team|
          GbPoint.create(team_id: team.id, value: 0)
        end
      end

      private

      def delete_data
        GbRound.delete_all
        GbPoint.delete_all
        GbBet.delete_all
      end

    end
  end
end
