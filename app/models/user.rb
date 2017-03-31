class User < ActiveRecord::Base
  attr_accessible :id, :name, :username, :password, :mobile

  has_many :hda_bets, class_name: 'Bets::HdaBet'
  has_many :fa_bets, class_name: 'Bets::FaBet'
  has_many :lms_bets, class_name: 'Bets::LmsBet'
  has_one :gb_bet, class_name: 'Bets::GbBet'
  has_one :sweep_bet, class_name: 'Bets::SweepBet'

  has_many :hda_points, class_name: 'Points::HdaPoint'
  has_one :fa_point, class_name: 'Points::FaPoint'
  has_one :lms_point, class_name: 'Points::LmsPoint'

  has_many :communications
  has_and_belongs_to_many :games
  has_one :position

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
    lms_bets.each do |bet|
      correct_count +=1 if bet.correct?
    end
    correct_count == Rounds::LmsRound.all.count-1
  end

  def in_sweep?
    sweep_bet.present? && sweep_bet.team.in_sweep?
  end

end
