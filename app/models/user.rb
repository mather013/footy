class User < ActiveRecord::Base
  attr_accessible :id, :username, :password, :name

  has_many :bets
  has_many :fa_bets
  has_many :lm_bets
  has_many :points
  has_one :fa_point
  has_one :lm_point
  has_and_belongs_to_many :games

  def fa_teams
    teams=[]
    fa_bets.each do |bet|
      teams << bet.player.team
      #teams << Player.find_by_id(bet.player_id).team
    end
    teams
  end

  def readonly_user?
    self.username == 'guest'
  end

  def lm_survivor?
    return false if readonly_user?
    correct_count = 0
    self.lm_bets.each do |bet|
      correct_count +=1 if bet.correct?
    end
    correct_count == LmRound.all.count-1
  end

end
