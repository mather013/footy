class Bet < ActiveRecord::Base
  attr_accessible :id, :fixture_id, :user_id, :value

  belongs_to :fixture

  validates :user_id, :uniqueness => {:scope => :fixture_id}

  scope :bets_for_user_and_fixtures, lambda { |user, fixture_ids| where('user_id = ? and fixture_id in (?)', user.id, fixture_ids) }

  def outcome
    return '' if fixture.score.nil?
    return 'correct' if value == fixture.score.outcome
    return 'wrong'
  end

  def correct?
    fixture.score.present? && value == fixture.score.outcome
  end

end
