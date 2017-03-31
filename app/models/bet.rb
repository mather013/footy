class Bet < ActiveRecord::Base

  self.abstract_class = true

  module Type
    HDA_BET = 'hda_bet'
    LMS_BET = 'lms_bet'
    GB_BET = 'gb_bet'
    FA_BET = 'fa_bet'
    SWEEP_BET = 'sweep_bet'
  end

end
