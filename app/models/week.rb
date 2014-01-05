class Week < ActiveRecord::Base
  attr_accessible :id, :week, :close_date, :description

  has_many :fixtures

  scope :sorted, :order => :close_date
  #scope :betable, lambda { where("weeks.close_date > ?", Time.now) }

  def betable?
    close_date > Time.now and close_date < Time.now + 7.days
  end

end
