class User < ActiveRecord::Base
  attr_accessible :id, :name, :username, :password, :mobile

  has_many :bets
  has_many :fa_bets
  has_many :lm_bets
  has_many :points
  has_many :communications
  has_one :fa_point
  has_one :lm_point
  has_and_belongs_to_many :games

  validates_presence_of :name, :username, :password

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
    return false if read_only?
    correct_count = 0
    lm_bets.each do |bet|
      correct_count +=1 if bet.correct?
    end
    correct_count == LmRound.all.count-1
  end

end
