class BetSingle < ActiveRecord::Base

  belongs_to :user

  scope :pending, -> { where(result: Result::PENDING) }
  scope :sorted, -> { order(:round_id) }

  validate :check_permitted

  module Result
    PENDING = 'pending'
    WON = 'won'
    LOST = 'lost'
  end

  def won?
    result == Result::WON
  end

  def lost?
    result == Result::LOST
  end

  def pending?
    result == Result::PENDING
  end

  def set_won
    self.update_attributes!(result: BetSingle::Result::WON)
  end

  def set_lost
    self.update_attributes!(result: BetSingle::Result::LOST)
  end

  def check_permitted
    errors.add(:selection, 'invalid selection chosen') if selection.to_i == 0
  end

end
