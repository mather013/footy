class Bet < ActiveRecord::Base
  attr_accessible :id, :fixture_id, :user_id, :value

  belongs_to :fixture

  validates :user_id, :uniqueness => {:scope => :fixture_id}

  scope :bets_for_user_and_fixtures, lambda { |user, fixture_ids| where("user_id = ? and fixture_id in (?)", user.id,fixture_ids) }

  def outcome
    fixture = Fixture.find(self.fixture_id)
    return "" if fixture.score.nil?
    return "correct" if self.value == fixture.score.outcome
    return "wrong"
  end

  def correct?
    self.fixture.score.present? && self.value == self.fixture.score.outcome
  end

end