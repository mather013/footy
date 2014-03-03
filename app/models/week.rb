class Week < ActiveRecord::Base
  attr_accessible :id, :week, :close_date, :description, :complete

  has_many :fixtures

  scope :sorted, :order => :close_date

  def status
    return "Complete" if complete?
    return "Open" if open?
    return "In play" if in_play?
    return "Pending"
  end

  def in_play?
    close_date < Time.now and !complete?
  end

  def open?
    close_date > Time.now and close_date < Time.now + 7.days
  end

end
