class Point < ActiveRecord::Base
  #attr_accessible :id, :week_id, :user_id, :value, :bonus

  belongs_to :user
  has_many :bonuses

  scope :sorted, -> { order('value DESC') }
  scope :total_points, -> { select('user_id, count(*) as count, sum(value) as total').group('user_id').order('total DESC') }
  scope :total_points_by_week, -> { select('user_id, sum(value) as total').group('user_id, week_id').order('total DESC') }
  scope :total_points_for_weeks, -> (week_ids) { select('user_id, sum(value) as total').where(week_id: week_ids).group(:user_id).order('total DESC') }

  def add_points(points)
    self.value += points[:value]
    self.bonus += points[:bonus] if points[:bonus]
    self.save!
  end

  def add_bonus(point, bet)
    bonus = self.bonuses.where(fixture_id: bet.fixture.id).first

    if point[:bonus] > 0
      bonus.present? ? bonus.update_attributes!(value: point[:bonus]) : self.bonuses.create!(fixture_id: bet.fixture.id, value: point[:bonus])
    else
      bonus.delete! if bonus.present?
    end
  end

end
