module Bets
  class GbBet < Bet
    attr_accessible :id, :user_id, :team_id

    belongs_to :user
    belongs_to :team

    validates :user_id, uniqueness: true
    validates :team_id, uniqueness: true

  end
end
