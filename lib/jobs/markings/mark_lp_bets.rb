module Markings
  class MarkLpBets < MarkSingleBets

    def initialize
      @name = 'LMS Player'
      @bet_class = LpBet
      @round_class = LpRound
      @point_class = LpPoint
      @new_round_resource = RakeTaskResources::AddLpRound
    end

    private

    def find_or_create_user_point(bet)
      bet.user.lp_point ||= bet.user.create_lp_point(value: 0)
    end

  end
end
