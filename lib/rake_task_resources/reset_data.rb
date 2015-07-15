module RakeTaskResources
  class ResetData
    class << self
      def perform
        Bet.delete_all
        Communication.delete_all
        Event.delete_all
        FaBet.delete_all
        FaPoint.delete_all
        Fixture.delete_all
        Goal.delete_all
        LmBet.delete_all
        LmPoint.delete_all
        LmRound.delete_all
        Player.delete_all
        Point.delete_all
        Position.delete_all
        Score.delete_all
        Standing.delete_all
        Team.delete_all
        Week.delete_all
      end
    end
  end
end
