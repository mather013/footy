class Point < ActiveRecord::Base
  attr_accessible :id, :week_id, :user_id, :value

  belongs_to :user
  has_many :bonuses

  scope :sorted, order('value DESC')
  scope :sorted_with_bonus, joins("LEFT JOIN bonuses ON bonuses.point_id = points.id").
      select('user_id, sum(COALESCE(bonuses.value,0)+points.value) as total, sum(points.value) as value, sum(COALESCE(bonuses.value,0)) as bonus').
      group('user_id').
      order('total DESC, value DESC, bonus desc')

  scope :total_points, select('user_id, count(*) as count, sum(value) as total').group('user_id').order('total DESC')
  scope :total_points_with_bonus, joins("LEFT JOIN bonuses ON bonuses.point_id = points.id").
      select('user_id, sum(COALESCE(bonuses.value,0)+points.value) as total, sum(points.value) as value, sum(COALESCE(bonuses.value,0)) as bonus').
      group('user_id').
      order('total DESC, value DESC, bonus desc')

  scope :user_weekly_with_bonus, joins("LEFT JOIN bonuses ON bonuses.point_id = points.id").
      select('user_id, week_id, sum(COALESCE(bonuses.value,0)+points.value) as total, sum(points.value) as value, sum(COALESCE(bonuses.value,0)) as bonus').
      group('user_id','week_id').
      order('total DESC, value DESC, bonus desc')

end
