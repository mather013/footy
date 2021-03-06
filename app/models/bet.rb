class Bet < ActiveRecord::Base

  belongs_to :fixture
  belongs_to :user

  validates :user_id, :uniqueness => {:scope => :fixture_id}
  validate :check_permitted

  scope :bets_for_user_and_fixtures, -> (user, fixture_ids) { where('user_id = ? and fixture_id in (?)', user.id, fixture_ids) }

  def outcome
    return '' if !fixture.finished? || fixture.score.nil?

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
    #fixture.week.fixtures.each do |fixture|
    #  if Bet.bets_for_user_and_fixtures(user, fixture.id).collect(&:value).count(value) > 0
    #    errors.add(:user_id, 'Sorry, score already chosen')
    #    return false
    #  end
    #end
    errors.add(:fixture_id, 'fixture has already kicked off') if fixture.kickoff < DateTime.now && !fixture.postponed?
  end

end
