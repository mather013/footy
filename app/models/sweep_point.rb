class SweepPoint < ActiveRecord::Base

  belongs_to :team

  scope :sorted, -> { order('value desc, id asc') }

end
