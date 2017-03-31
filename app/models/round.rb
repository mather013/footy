class Round < ActiveRecord::Base

  self.abstract_class = true

  module Type
    LMS_ROUND = 'lms_round'
    GB_ROUND = 'gb_round'
  end

end
