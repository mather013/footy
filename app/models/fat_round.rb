class FatRound < ActiveRecord::Base

  belongs_to :week

  scope :sorted, -> { order('week_id desc') }

  validates :week_id, uniqueness: true

  def description
    "Round #{format('%02d', id)}"
  end

end
