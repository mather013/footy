class GbBet < ActiveRecord::Base

  belongs_to :user
  belongs_to :team

  scope :sorted, -> { order('id asc') }

  validates :user_id, uniqueness: true
  validates :team_id, uniqueness: true

end
