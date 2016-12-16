module Jobs
  class MarkWeek

    def perform
      week = Week.previous
      RakeTaskResources::MarkWeek.perform week.id
      RakeTaskResources::RefreshPositions.perform
      RakeTaskResources::MarkFaBets.perform if TOGGLES_CONFIG['five_alive']
      RakeTaskResources::MarkLmBets.perform if TOGGLES_CONFIG['last_man_standing']
      RakeTaskResources::MarkGbBets.perform if TOGGLES_CONFIG['goal_buster']
    end

  end
end
