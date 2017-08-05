class FatSelection < ActiveRecord::Base

  belongs_to :user

  scope :sorted, -> { order('id asc') }

  validates :user_id, uniqueness: true
  validate :check_permitted

  def to_h
    eval(value) if value.present?
  end

  def check_permitted
    selections = value.split(',', -1).reject { |c| c.empty? }
    contains_dupes = selections.uniq.length != selections.length
    errors.add(:value, 'selection contains dupes') if contains_dupes
  end

end
