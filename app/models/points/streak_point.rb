module Points
  class StreakPoint < ActiveRecord::Base

    belongs_to :user
    belongs_to :round

    scope :sorted, -> { order('round_id ASC, value DESC') }
    scope :for_user_and_round, -> (user_id, round_id) { where('user_id = ? AND round_id = ?', user_id, round_id) }

  end
end
