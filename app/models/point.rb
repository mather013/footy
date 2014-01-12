class Point < ActiveRecord::Base
  attr_accessible :id, :week_id, :user_id, :value

  scope :sorted, :order => :value

end
