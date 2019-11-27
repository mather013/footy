module Points
  class GoalsGalorePoint < ActiveRecord::Base

    belongs_to :user

    scope :sorted, -> { order('round_id ASC, value DESC') }
    scope :totals_sorted, -> { select('user_id, sum(value) as total').where('value >= 0').group(:user_id).order('total DESC') }
    scope :for_user_and_round, -> (user_id, round_id) { where('user_id = ? AND round_id = ?', user_id, round_id) }
    scope :for_round, -> (round_id) { where('round_id = ?', round_id) }

    def add_points(points)
      new_value = self.value + points
      self.update_attributes!(value: new_value)
    end

  end
end
