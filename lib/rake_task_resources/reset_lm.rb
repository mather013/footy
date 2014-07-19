module RakeTaskResources
  class ResetLm
    class << self
      def perform week_id
        LmBet.delete_all
        LmRound.delete_all
        LmRound.find_or_create_by_id(id: 1, week_id: week_id)
      end
    end
  end
end
