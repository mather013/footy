class Competition < ActiveRecord::Base
  attr_accessible :id, :number, :start_date, :close_date, :description

  has_many :competition_fixtures
  has_many :fixtures, :through => :competition_fixtures

  scope :sorted, :order => :close_date
  scope :betable, lambda {
    where("competitions.close_date > ?", Time.now)
  }

end
