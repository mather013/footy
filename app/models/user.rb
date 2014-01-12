class User < ActiveRecord::Base
  attr_accessible :id, :username, :password, :name

  has_many :bets

end
