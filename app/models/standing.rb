class Standing  < ActiveRecord::Base
  attr_accessible :id, :position, :team_id, :form, :form_score, :points, :played, :goal_difference

  belongs_to :team

  scope :sorted, order('form_score desc, position asc, goal_difference asc, team_id asc')

end
