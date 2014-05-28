class FaBet < ActiveRecord::Base
  attr_accessible :id, :user_id, :player_id

  belongs_to :user

end
