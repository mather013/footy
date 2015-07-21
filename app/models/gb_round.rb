class GbRound < ActiveRecord::Base
  attr_accessible :id, :starting_week_id

  belongs_to :week, foreign_key: 'starting_week_id', class_name: 'Week'

  def started?
    self.week.close_date < DateTime.now
  end

  def open?
    week.close_date > Time.now and week.close_date < Time.now + ENVIRONMENT_CONFIG['round_open_period_in_days'].days
  end

  def open_at
    week.close_date - ENVIRONMENT_CONFIG['round_open_period_in_days'].days
  end

end
