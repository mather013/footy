class Competition < ActiveRecord::Base
  attr_accessible :id, :week, :close_date, :description

  has_many :fixtures

  scope :sorted, :order => :close_date
  scope :betable, lambda { where("competitions.close_date > ?", Time.now) }

end
