module RakeTaskResources
  class ResetData
    class << self
      def perform
        Point.delete_all
        Bet.delete_all
        FaPoint.delete_all
        FaBet.delete_all
        Goal.delete_all
        Score.delete_all
      end
    end
  end
end
