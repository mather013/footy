module Bets
  class HdaBet < Bet
    attr_accessible :id, :fixture_id, :user_id, :value

    belongs_to :fixture
    belongs_to :user

    validates :user_id, :uniqueness => {:scope => :fixture_id}
    validate :check_permitted

    scope :bets_for_user_and_fixtures, lambda { |user, fixture_ids| where('user_id = ? and fixture_id in (?)', user.id, fixture_ids) }

    def outcome
      return '' if fixture.score.nil?

      if TOGGLES_CONFIG['bet_type_hda']
        return 'correct' if value == fixture.score.outcome
      else
        return 'spot_on' if value == fixture.score.to_s
        return 'correct' if value_outcome == fixture.score.outcome
      end

      return 'wrong'
    end

    def correct?
      if TOGGLES_CONFIG['bet_type_hda']
        fixture.score.present? && value == fixture.score.outcome
      else
        fixture.score.present? && value_outcome == fixture.score.outcome
      end
    end

    private

    def value_outcome
      return nil unless value.length == 5
      home = value[0]
      away = value[4]
      return 'H' if home > away
      return 'D' if home == away
      return 'A' if away > home
    end

    def check_permitted
      errors.add(:fixture_id, 'fixture has already kicked off') if fixture.kickoff < DateTime.now
    end

  end
end
