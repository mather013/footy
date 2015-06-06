class Player < ActiveRecord::Base
  attr_accessible :id, :surname, :forename, :team_id, :squad_number

  scope :team_and_surname_order, order('team_id asc, surname asc')

  belongs_to :team
  has_many :goals

  validates :surname, :uniqueness => {:scope => :forename}

  def name
    "#{forename} #{surname}".to_s
  end

  def name_and_number
    "#{name} ##{squad_number}".to_s
  end

end
