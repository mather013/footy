class Bet < ActiveRecord::Base
  attr_accessible :id, :fixture_id, :user_id, :value

end