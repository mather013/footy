class GbRound < ActiveRecord::Base
  attr_accessible :id, :starting_week_id

  belongs_to :week, foreign_key: 'starting_week_id', class_name: 'Week'

  def open?
    Time.now > open_at
  end

  def open_at
    DateTime.parse(week.close_date.to_date.to_s + ' 10:00:00')
  end

end
