class Group < ActiveRecord::Base

  has_many :group_teams
  has_many :teams, through: :group_teams

  scope :sorted, -> { order('id asc') }

end
