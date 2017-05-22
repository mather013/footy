class GbPoint < ActiveRecord::Base

  belongs_to :team

  scope :sorted, -> { order('value desc, minute asc') }

end
