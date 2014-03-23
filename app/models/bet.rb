class Bet < ActiveRecord::Base
  attr_accessible :id, :fixture_id, :user_id, :value

  validates :user_id, :uniqueness => {:scope => :fixture_id}

  scope :bets_for_user_and_fixtures, lambda { |user, fixture_ids| where("user_id = ? and fixture_id in (?)", user.id,fixture_ids) }

  def outcome
    fixture = Fixture.find(self.fixture_id)
    return "" if fixture.score.nil?
    return "correct" if self.value == fixture.score.outcome
    return "wrong"
  end
end