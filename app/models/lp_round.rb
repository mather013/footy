class LpRound < ActiveRecord::Base

  belongs_to :week

  scope :sorted, -> { order('week_id ASC') }

  def self.current
    self.last
  end

  def results
    { winning_selections: winning_selections,
      settle: can_be_settled? }
  end

  private

  def winning_selections
    week.scorers.map(&:id)
  end

  def can_be_settled?
    week.fixtures_strict.map(&:finished?).uniq == [true]
  end

end
