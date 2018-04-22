class LeagueStanding < Standing

  scope :sorted, -> { order('form_score desc, position asc, goal_difference asc, team_id asc') }

  class << self

    def refresh
      delete_all
      team_stats(Team.all).each_with_index do |stats, i|
        params = {id: i+1,
                  position: i+1,
                  played: stats[:pld],
                  team_id: stats[:team_id],
                  points: stats[:pts],
                  goals_for: stats[:gf],
                  goals_against: stats[:ga],
                  goal_difference: stats[:gd],
                  form: stats[:form]}

        create(params)
      end
    end

  end
end
