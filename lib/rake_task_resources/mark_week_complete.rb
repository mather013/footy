module RakeTaskResources
  class MarkWeekComplete
    class << self
      def perform week_id
        Week.find(week_id).update_attributes(complete: true)
        add_next_lm_round
      end

      private

      def add_next_lm_round
        last_round = LmRound.last
        LmRound.find_or_create_by_id(id: last_round.id+1, week_id: last_round.week_id+1)
      end

    end
  end
end
