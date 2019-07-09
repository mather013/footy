class LpRound < ActiveRecord::Base

  belongs_to :week

  scope :sorted, -> { order('week_id ASC') }

  def self.current
    self.last
  end

end
