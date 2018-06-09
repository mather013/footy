class FaPoint < ActiveRecord::Base

  scope :total_points, -> { select('user_id, value').order('value DESC') }

  scope :total_points_for_user_ids, -> (user_ids) { select('user_id, value').where('user_id in (?)', user_ids).order('value DESC') }

end
