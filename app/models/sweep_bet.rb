class SweepBet < ActiveRecord::Base

  belongs_to :user
  belongs_to :team

  scope :sorted, -> { order('id asc') }

  validates :user_id, uniqueness: true

  def self.available?
    self.count < Team.count
  end

end
