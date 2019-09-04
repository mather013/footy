class LpRound < ActiveRecord::Base

  belongs_to :week

  scope :sorted, -> { order('week_id ASC') }

  def self.current
    self.last
  end

  def results
    { winning_selections: week.scorers.map(&:id),
      settle: can_be_settled? }
  end

  private

  def can_be_settled?
    week.fixtures_strict.map(&:finished?).uniq == [true]
  end

end
