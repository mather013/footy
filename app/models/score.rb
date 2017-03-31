class Score < ActiveRecord::Base

  attr_accessible :id, :fixture_id, :home, :away

  belongs_to :fixture
  has_many   :goals

  def to_s
    "#{home} - #{away}"
  end

  def home_win?
    home > away
  end

  def away_win?
    away > home
  end

  def draw?
    home == away
  end

  def outcome
    home_win? ? 'H' : away_win? ? 'A' : 'D'
  end

end
