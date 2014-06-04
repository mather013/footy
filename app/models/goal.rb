class Goal < ActiveRecord::Base
  attr_accessible :id, :player_id, :score_id

  belongs_to :score,  :foreign_key => "score_id"
  belongs_to :player, :foreign_key => "player_id"

  scope :sorted, order("players.goals DESC")

end
