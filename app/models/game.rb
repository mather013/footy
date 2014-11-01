class Game < ActiveRecord::Base
  attr_accessible :id, :name, :description

  has_and_belongs_to_many :users

end
