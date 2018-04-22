class GroupStanding < Standing

  scope :sorted, -> { order('group_id asc, position asc, goal_difference asc, team_id asc') }
  belongs_to :group

  class << self

    def refresh
      delete_all
      i=0

      groups.each do |group|
        position = 1

        team_stats(group.teams).each do |stats|

          params = {id: i+1,
                    position: position,
                    played: stats[:pld],
                    team_id: stats[:team_id],
                    points: stats[:pts],
                    goals_for: stats[:gf],
                    goals_against: stats[:ga],
                    goal_difference: stats[:gd],
                    form: stats[:form],
                    group_id: group.id}

          position +=1
          i+=1

          create(params)
        end
      end
    end

    def groups
      Group.sorted
    end

  end
end
