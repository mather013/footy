module RakeTaskResources
  class ResetData
    class << self
      def perform
        Point.delete_all
        Bet.delete_all
        FaPoint.delete_all
        FaBet.delete_all
        LmPoint.delete_all
        LmBet.delete_all
        Goal.delete_all
        Score.delete_all
        LmRound.delete_all
        Position.delete_all
        Standing.delete_all
        Fixture.delete_all
        Communication.delete_all
        Event.delete_all
      end
    end
  end
end
