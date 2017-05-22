class Player < ActiveRecord::Base

  belongs_to :team
  has_many :goals

  scope :team_and_surname_order, -> { order('team_id asc, surname asc') }
  scope :by_surname, -> { order('surname asc') }

  validates :surname, :uniqueness => {:scope => :forename}

  def name
    "#{forename} #{surname}".to_s
  end

  def name_and_number
    "#{name} ##{squad_number}".to_s
  end

end
