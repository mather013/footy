class Standing  < ActiveRecord::Base
  attr_accessible :id, :position, :team_id, :form, :form_score, :points

  belongs_to :team

  scope :sorted, order('form_score desc, position asc')

end
