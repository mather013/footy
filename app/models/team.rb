class Team  < ActiveRecord::Base
  attr_accessible :id, :name, :abbreviation, :external_id

  has_one :standing

end
