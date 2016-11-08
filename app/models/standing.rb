class Standing < ActiveRecord::Base
  attr_accessible :id, :position, :team_id, :form, :form_score, :points, :played, :goal_difference

  belongs_to :team

  scope :sorted, order('form_score desc, position asc, goal_difference asc, team_id asc')

  class << self

    def up_to_date?
      (Standing.all.collect(&:played).sum/2) >= Fixture.joins(:score).count
    end

    def refresh
      Standing.delete_all
      team_stats.each_with_index do |stats, i|
        params = {id: i+1, position: i+1, played: stats[:pld], team_id: stats[:team_id], points: stats[:pts], goal_difference: stats[:gd], form: stats[:form]}
        Standing.create(params)
      end
    end

    private

    def team_stats
      team_stats = []
      Team.all.each { |team| team_stats << {team_id: team.id}.merge(team.league_stats) }
      team_stats.sort! { |a, b| [a[:pts], a[:gd]] <=> [b[:pts], b[:gd]] }.reverse!
    end

  end
end
