class BetSingle < ActiveRecord::Base

  belongs_to :user

  scope :bets_for_user_and_round, -> (user, round) { where('user_id = ? and round_id = ?', user.id, round.id) }
  scope :pending, -> { where(result: Result::PENDING) }

  module Result
    PENDING = 'pending'
    WON = 'won'
    LOST = 'lost'
  end

  def set_won
    self.update_attributes!(result: BetSingle::Result::WON)
  end

  def set_lost
    self.update_attributes!(result: BetSingle::Result::LOST)
  end

end
