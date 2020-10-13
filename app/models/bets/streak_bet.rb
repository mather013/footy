module Bets
  class StreakBet < BetSingle

    belongs_to :player, foreign_key: :selection, class_name: 'Player'
    belongs_to :round,   foreign_key: :round_id,  class_name: 'Rounds::StreakRound'

    validates :user_id, uniqueness: {scope: :selection}
    validate  :check_permitted

    scope :for_user_and_round, -> (user_id, round_id) { where('user_id = ? AND round_id = ?', user_id, round_id) }
    scope :for_round, -> (round_id) { where('round_id = ?', round_id) }

    private

    def check_permitted
      # errors.add(:round_id, 'round has already started') if round.week.close_date < DateTime.now
      true
    end

  end
end
