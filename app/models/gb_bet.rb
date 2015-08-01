class GbBet < ActiveRecord::Base
  attr_accessible :id, :user_id, :team_id

  belongs_to :user
  belongs_to :team

  scope :sorted, order('id asc')

  validates :user_id, uniqueness: true
  validates :team_id, uniqueness: true

end
