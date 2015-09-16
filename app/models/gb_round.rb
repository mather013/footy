class GbRound < ActiveRecord::Base
  attr_accessible :id, :starting_week_id

  belongs_to :week, foreign_key: 'starting_week_id', class_name: 'Week'

  def started?
    self.week.close_date < DateTime.now
  end

  def open?
    week.close_date > Time.now && Time.now > open_at
  end

  def open_at
    DateTime.parse(week.close_date.to_date.to_s + ' 09:00:00')
  end

end
