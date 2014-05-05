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

  def close_date_local_time
    close_date.in_time_zone("London")
  end

  def in_play?
    close_date < current_date_and_time and !complete?
  end

  def open?
    close_date > current_date_and_time and close_date < current_date_and_time + ENVIRONMENT_CONFIG['round_open_period_in_days'].days
  end

  private

  def current_date_and_time
    Time.now
  end

end
