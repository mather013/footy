class Bonus < ActiveRecord::Base
  #attr_accessible :id, :point_id, :fixture_id, :value

  belongs_to :point
  belongs_to :fixture

end
