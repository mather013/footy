class Standing < ActiveRecord::Base

  belongs_to :team

  class << self

    def up_to_date?
      return false if GroupStanding.count == 0
      (all.collect(&:played).sum/2) >= Fixture.finished.joins(:score).count
    end

    private

    def team_stats(teams)
      team_stats = []
      teams.each { |team| team_stats << {team_id: team.id}.merge(team.league_stats) }
      team_stats.sort! { |a, b| [b[:pts], b[:gd], b[:gf]] <=> [a[:pts], a[:gd], a[:gf]] }
    end

  end
end
