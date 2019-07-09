class Player < ActiveRecord::Base

  belongs_to :team
  has_many :goals

  scope :team_and_surname_order, -> { order('team_id asc, surname asc') }
  scope :by_surname, -> { order('surname asc') }
  scope :active, -> { where(active: true) }

  # validates :surname, :uniqueness => {:scope => :forename}
  # validates :reference, uniqueness: true

  before_save :generate_reference

  def name
    forename.nil? || forename.blank? ? surname.upcase.to_s : "#{forename}. #{surname.upcase}".to_s
  end

  def short_name
    forename.nil? || forename.blank? ? surname.upcase.to_s : "#{forename[0]} #{surname.upcase}".to_s
  end

  def name_and_number
    "#{name} ##{squad_number}".to_s
  end

  def generate_reference
    self.reference = team.abbreviation.upcase + squad_number.to_s
  end

  def self.position_order
    order("CASE
    WHEN players.position = 'FW' THEN '1'
    WHEN players.position = 'MF' THEN '2'
    WHEN players.position = 'DF' THEN '3'
    WHEN players.position = 'GK' THEN '4'
  END")
  end
end
