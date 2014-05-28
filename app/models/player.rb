class Player < ActiveRecord::Base
  attr_accessible :id, :name, :team_id

  belongs_to :team, :foreign_key => "team_id"
  has_many :goals

  #scope :sorted, order("players.goals DESC")

  def total_goals
    goals.sum("amount")
  end

end
