module Points
  class SweepPoint < Point
    attr_accessible :id, :team_id, :value

    belongs_to :team

    scope :sorted, order('value desc, id asc')

  end
end
