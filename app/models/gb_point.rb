class GbPoint < ActiveRecord::Base
  attr_accessible :id, :team_id, :value, :minute

  belongs_to :team

  scope :sorted, order('value desc, minute asc')

end
