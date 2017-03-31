module RakeTaskResources
  class ResetData
    class << self
      def perform
        Bets::HdaBet.delete_all
        Bets::LmsBet.delete_all
        Bets::FaBet.delete_all
        Bets::GbBet.delete_all
        Bets::SweepBet.delete_all

        Points::HdaPoint.delete_all
        Points::LmsPoint.delete_all
        Points::FaPoint.delete_all
        Points::GbPoint.delete_all
        Points::SweepPoint.delete_all

        Rounds::LmsRound.delete_all
        Rounds::GbRound.delete_all

        Communication.delete_all
        Event.delete_all
        Fixture.delete_all
        Goal.delete_all
        Player.delete_all
        Position.delete_all
        Score.delete_all
        Standing.delete_all
        Team.delete_all
        Week.delete_all
      end
    end
  end
end
