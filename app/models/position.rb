class Position < ActiveRecord::Base

  attr_accessible :id, :user_id, :previous, :current, :last_marked_week_id

  belongs_to :user

  def movement
    return "none" if current == previous
    current < previous ? "up" : "down"
  end

end
