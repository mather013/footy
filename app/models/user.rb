class User < ActiveRecord::Base
  attr_accessible :id, :username, :password, :name, :payout_user

  has_many :bets
  has_many :fa_bets

  def fa_teams
    teams=[]
    fa_bets.each do |bet|
      teams << Player.find_by_id(bet.player_id).team.abbreviation
    end
    teams
  end

end
