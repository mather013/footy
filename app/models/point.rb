class Point < ActiveRecord::Base

  self.abstract_class = true

  module Type
    HDA_POINT = 'hda_point'
    LMS_POINT = 'lms_point'
    GB_POINT = 'gb_point'
    FA_POINT = 'fa_point'
    SWEEP_POINT = 'sweep_point'
  end

end
