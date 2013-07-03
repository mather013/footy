class Score < ActiveRecord::Base

  attr_accessible :home, :away

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
end