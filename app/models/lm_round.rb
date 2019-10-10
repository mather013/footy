class LmRound < ActiveRecord::Base

  belongs_to :week

  scope :sorted, -> { order('week_id ASC') }

  def self.current
    self.last
  end

  def self.new_competition?
    self.count == 1
  end

  def first_round?
    self.class.new_competition?
  end

  def results
    { winning_selections: winning_selections,
      settle: can_be_settled? }
  end

  private

  def winning_selections
    week.winning_teams.map(&:id)
  end

  def can_be_settled?
    week.fixtures_strict.map(&:finished?).uniq == [true]
  end

end
