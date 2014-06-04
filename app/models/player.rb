class Player < ActiveRecord::Base
  attr_accessible :id, :name, :team_id

  belongs_to :team
  has_many :goals

end
