class Point < ActiveRecord::Base
  attr_accessible :id, :week_id, :user_id, :value, :new_value

  scope :sorted, order("new_value DESC")
  scope :point_for_user_and_week, lambda { |user, week| where("user_id = ? and week_id = ?",user.id,week.id) }


end
