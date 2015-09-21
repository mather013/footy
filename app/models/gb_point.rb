class GbPoint < ActiveRecord::Base
  attr_accessible :id, :team_id, :value

  belongs_to :team

  scope :sorted, order('value desc, team_id asc')

end
