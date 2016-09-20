class Winner < ActiveRecord::Base

  attr_accessible :id, :user_id, :type, :total, :number

  belongs_to :user

  module Frequency
    WEEKLY = 'weekly'
    MONTHLY = 'monthly'
  end

end
