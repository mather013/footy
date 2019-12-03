module Rounds
  class GoalsGaloreRound < Round

    has_many :points, foreign_key: :round_id, class_name: 'Points::GoalsGalorePoint'

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
      {winning_selections: winning_selections,
       losing_selections: losing_selections,
       settle: can_be_settled?}
    end

    private

    def winning_selections
      week.fixtures.finished.map(&:score).select { |s| s.home > 0 && s.away > 0 if s }.map(&:fixture_id)
    end

    def losing_selections
      week.fixtures.finished.map(&:score).select { |s| s.home == 0 || s.away == 0 if s }.map(&:fixture_id)
    end

    def can_be_settled?
      week.fixtures_strict.map(&:finished?).uniq == [true]
    end

  end
end
