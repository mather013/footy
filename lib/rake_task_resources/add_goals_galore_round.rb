module RakeTaskResources
  class AddGoalsGaloreRound
    class << self

      def perform
        last_round = Rounds::GoalsGaloreRound.last
        Rounds::GoalsGaloreRound.find_or_create_by(id: last_round.id+1, week_id: last_round.week_id+1)
      end

    end
  end
end
