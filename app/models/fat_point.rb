class FatPoint < ActiveRecord::Base

  belongs_to :user
  belongs_to :fat_round

  scope :total_points, -> { select('user_id, count(*) as count, sum(value) as total').group('user_id').order('total DESC') }

end
