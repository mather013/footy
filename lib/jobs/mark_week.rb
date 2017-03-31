module Jobs
  class MarkWeek

    def perform(week_id=nil)
      week = week_id.present? ? Week.find(week_id) : Week.previous
      RakeTaskResources::MarkWeek.perform week.id
      RakeTaskResources::RefreshPositions.perform
      RakeTaskResources::MarkFaBets.perform if TOGGLES_CONFIG['five_alive']
      RakeTaskResources::MarkLmBets.perform if TOGGLES_CONFIG['last_man_standing']
      RakeTaskResources::MarkGbBets.perform if TOGGLES_CONFIG['goal_buster']
    end

  end
end
