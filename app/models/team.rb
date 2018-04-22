class Team < ActiveRecord::Base

  has_one :standing
  has_one :gb_point
  has_one :sweep_point
  has_many :players
  has_many :events
  has_many :home_fixtures, foreign_key: 'home_team_id', class_name: 'Fixture'
  has_many :away_fixtures, foreign_key: 'away_team_id', class_name: 'Fixture'
  has_one :group_team
  has_one :group, through: :group_team

  scope :sorted, -> { where("name != 'TBA'").order('name asc') }
  scope :sorted_by_group, -> { where("teams.name != 'TBA'").joins(:group).order('groups.id asc') }

  def in_sweep?
    sweep_point.present? && sweep_point.value == maximum_sweep_points
  end

  def fixtures
    (home_fixtures + away_fixtures).sort_by &:kickoff
  end

  def fixtures_from(date)
    result=[]
    fixtures.each { |f| result << f if f.kickoff >= date }
    result
  end

  def form
    standing.form
  end

  def short_name
    self[:short_name] || self.name
  end

  def results
    TeamStatsFull.new(self).perform[:results]
  end

  def calc_form
    results.last(5)
  end

  def league_stats
    TeamStatsLeague.new(self).perform
  end

  def stats
    TeamStatsFull.new(self).perform
  end

  private

  def maximum_sweep_points
    Week.count+1
  end

end
