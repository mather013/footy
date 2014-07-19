class LmRound < ActiveRecord::Base
  attr_accessible :id, :week_id

  belongs_to :week

  scope :sorted, order("week_id ASC")

  def self.current
    self.last
  end

end
