class User < ActiveRecord::Base
  attr_accessible :id, :username, :password, :name, :payout_user

  has_many :bets
  has_many :fa_bets
  has_many :points
  has_one :fa_point

  def fa_teams
    teams=[]
    fa_bets.each do |bet|
      teams << bet.player.team
      #teams << Player.find_by_id(bet.player_id).team
    end
    teams
  end

end
