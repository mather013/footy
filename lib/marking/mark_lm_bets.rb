module Marking
  class MarkLmBets < MarkSingleBets

    def initialize
      @name = 'LMS Team'
      @bet_class = LmBet
      @round_class = LmRound
      @point_class = LmPoint
      @new_round_resource = RakeTaskResources::AddLmRound
    end

    private

    def find_or_create_user_point(bet)
      bet.user.lm_point ||= bet.user.create_lm_point(value: 0)
    end

  end
end
