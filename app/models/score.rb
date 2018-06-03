class Score < ActiveRecord::Base

  belongs_to :fixture
  has_many   :goals

  validates :fixture_id, uniqueness: true

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
    return 'H' if home_win?
    return 'D' if draw?
    return 'A' if away_win?
  end

end
