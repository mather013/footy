class FatRound < ActiveRecord::Base

  belongs_to :week
  has_many :bets, :foreign_key => 'fat_round_id', :class_name => 'FatBet'
  has_many :points, :foreign_key => 'fat_round_id', :class_name => 'FatPoint'

  scope :sorted, -> { order('week_id desc') }
  scope :latest, -> { sorted.limit(1).first }

  validates :week_id, uniqueness: true

  def description
    "Round #{format('%02d', id)}"
  end

end
