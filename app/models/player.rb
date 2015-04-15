class Player < ActiveRecord::Base
  attr_accessible :id, :surname, :forename, :team_id

  scope :name_order, order('team_id asc, surname asc')

  belongs_to :team
  has_many :goals

  validates :surname, :uniqueness => {:scope => :forename}

  def name
    "#{forename} #{surname}".to_s
  end

end
