class FaPoint < ActiveRecord::Base

  scope :total_points, -> { select('user_id, value').order('value DESC') }

end
