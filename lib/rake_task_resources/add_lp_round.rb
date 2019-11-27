module RakeTaskResources
  class AddLpRound
    class << self

      def perform
        last_round = LpRound.last
        LpRound.find_or_create_by(id: last_round.id+1, week_id: last_round.week_id+1)
      end

    end
  end
end
