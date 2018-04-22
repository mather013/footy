class TeamStatsLeague < TeamStats

  private

  def weeks
    Week.league_weeks
  end

end
