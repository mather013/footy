module Jobs
  class MarkWeek

    def perform
      week = Week.previous
      RakeTaskResources::MarkWeek.perform week.id
      RakeTaskResources::RefreshPositions.perform
      RakeTaskResources::MarkFaBets.perform if TOGGLES_CONFIG['five_alive']
      Markings::MarkLmBets.perform if TOGGLES_CONFIG['last_man_standing']
      Markings::MarkLpBets.perform if TOGGLES_CONFIG['last_player_standing']
      RakeTaskResources::MarkGbBets.perform if TOGGLES_CONFIG['goal_buster']
      RakeTaskResources::MarkFatBets.perform week.id if TOGGLES_CONFIG['five_alive_twist']
    end

  end
end
