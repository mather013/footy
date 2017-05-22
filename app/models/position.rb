class Position < ActiveRecord::Base

  belongs_to :user

  def movement
    return 'none' if current == previous
    current < previous ? 'up' : 'down'
  end

end
