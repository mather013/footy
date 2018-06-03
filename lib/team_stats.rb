class TeamStats

  def initialize(team)
    @team = team
  end

  def perform
    @weeks = weeks

    gf = goals_for
    ga = goals_against
    team_results = results

    hash = { pld: 0, pts: 0, gf: gf, ga: ga, gd: gf-ga, form: team_results.last(5).join(''), results: team_results }

    team_results.each do |result|
      hash[:pts] += 1 if result == 'D'
      hash[:pts] += 3 if result == 'W'
      hash[:pld] += 1
    end
    hash
  end

  private

  def goals_for
    home_goals[:goals_for]+away_goals[:goals_for]
  end

  def goals_against
    home_goals[:goals_against]+away_goals[:goals_against]
  end

  def home_goals
    scores = @team.home_fixtures.finished.where(week_id: @weeks.map(&:id)).joins(:score).collect(&:score)
    {goals_for: scores.collect(&:home).sum, goals_against: scores.collect(&:away).sum}
  end

  def away_goals
    scores = @team.away_fixtures.finished.where(week_id: @weeks.map(&:id)).joins(:score).collect(&:score)
    {goals_for: scores.collect(&:away).sum, goals_against: scores.collect(&:home).sum}
  end

  def results
    finished_fixtures = Fixture.finished.where(week_id: @weeks.map(&:id)).joins(:score).where('home_team_id = ? OR away_team_id = ?', @team.id, @team.id)
    calc_results(finished_fixtures)
  end

  def calc_results(fixtures)
    result = []

    fixtures.order(:kickoff).each do |fixture|
      is_home_team = fixture.home_team_id == @team.id

      case fixture.score.outcome
        when 'D'
          result << 'D'
        when 'H'
          is_home_team ? result << 'W' : result << 'L'
        when 'A'
          is_home_team ? result << 'L' : result << 'W'
      end
    end
    result
  end

end
