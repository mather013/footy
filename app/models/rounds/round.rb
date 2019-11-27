module Rounds
  class Round < ActiveRecord::Base

    belongs_to :week

    scope :sorted, -> { order('week_id ASC') }

  end
end
