class User < ActiveRecord::Base
  attr_accessible :id, :username, :password

  has_many :bets

end
