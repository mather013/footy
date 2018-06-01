class FaBet < ActiveRecord::Base

  belongs_to :user
  belongs_to :player

  scope :sorted, -> { order('id asc') }

  validates :user_id, :uniqueness => {:scope => :player_id}
  validate :combination_unique

  def combination_unique
    unless Player.try(:find_by, id: player_id)
      errors.add(:player_id, 'Sorry, invalid player chosen')
      return false
    end

    users_selections = User.find_by_id(user_id).fa_bets.map(&:player_id).sort
    return true if player_id_was.present? and users_selections.count < 5

    if users_selections.count < 5
      users_selections << player_id
    else
      users_selections.map! { |x| x == player_id_was ? player_id : x }.flatten!
    end

    user_ids = FaBet.all.map(&:user_id).uniq
    user_ids.delete(user_id)
    user_ids.each do |rival_user_id|
      rival_selections = User.find_by_id(rival_user_id).fa_bets.map(&:player_id)
      if users_selections.count == 5 && rival_selections.sort == users_selections.sort
        errors.add(:player_id, 'Sorry, invalid combination chosen')
      end
    end
  end

end
