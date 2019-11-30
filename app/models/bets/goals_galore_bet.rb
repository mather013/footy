module Bets
  class GoalsGaloreBet < BetSingle

    belongs_to :fixture, foreign_key: :selection, class_name: 'Fixture'
    belongs_to :round,   foreign_key: :round_id,  class_name: 'Rounds::GoalsGaloreRound'

    validates :user_id, uniqueness: {scope: :selection}
    validate  :check_permitted

    scope :for_user_and_round, -> (user_id, round_id) { where('user_id = ? AND round_id = ?', user_id, round_id) }
    scope :for_round, -> (round_id) { where('round_id = ?', round_id) }

    # MAXIMUM_SELECTIONS_PER_USER_ROUND = 10.freeze

    private

    def check_permitted
      errors.add(:round_id, 'round has already started') if round.week.close_date < DateTime.now
    end

    # def check_permitted
    #   if new_record? && bet_exceeds_user_round_limit?
    #     errors.add(:selection, "only #{MAXIMUM_SELECTIONS_PER_USER_ROUND} selections permitted per round")
    #   end
    # end
    #
    # def bet_exceeds_user_round_limit?
    #   Bets::GoalsGaloreBet.for_user_and_round(user_id, round_id).count >= MAXIMUM_SELECTIONS_PER_USER_ROUND
    # end

  end
end
