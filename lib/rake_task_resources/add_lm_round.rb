module RakeTaskResources
  class AddLmRound
    class << self

      def perform
        last_round = Rounds::LmsRound.last
        Rounds::LmsRound.find_or_create_by_id(id: last_round.id+1, week_id: last_round.week_id+1)
      end

    end
  end
end
