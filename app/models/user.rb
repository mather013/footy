class User < ActiveRecord::Base

  has_many :bets
  has_many :fa_bets
  has_many :lm_bets
  has_many :lp_bets
  has_many :points
  has_many :communications
  has_one :fa_point
  has_one :lm_point
  has_one :lp_point
  has_and_belongs_to_many :games
  has_one :position
  has_one :gb_bet
  has_one :sweep_bet
  has_one :fat_selection
  has_many :fat_bets
  has_many :fat_points
  has_many :goals_galore_points, class_name: 'Points::GoalsGalorePoint'
  has_many :goals_galore_bets,   class_name: 'Bets::GoalsGaloreBet'
  has_one :streak_selection, class_name: 'Selections::StreakSelection'

  validates_presence_of :name, :username, :password

  def plays?
    bets.present? || lm_bets.present? || fa_bets.present? || lp_bets.present?
  end

  def admin?
    username == 'markm'
  end

  def read_only?
    username == 'guest'
  end

  def fa_teams
    teams=[]
    fa_bets.each do |fa_bet|
      teams << fa_bet.player.team
    end
    teams
  end

  def lm_survivor?
    return true if LmRound.new_competition?
    results = lm_bets.map(&:result)
    results.present? && results.count('won') >= LmRound.count-1
  end

  def lp_survivor?
    return true if LpRound.new_competition?
    results = lp_bets.map(&:result)
    results.present? && results.count('won') >= LpRound.count-1
  end

  def in_sweep?
    sweep_bet.present? && sweep_bet.team.in_sweep?
  end

  def fat_survivor?(round_id)
    bets = fat_bets.for_round_sorted(round_id)

    bets.all.each do |bet|
      return false if bet.correct? == false
    end
    true
  end

end
