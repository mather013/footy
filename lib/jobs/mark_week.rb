module Jobs
  class MarkWeek
    class << self

      def perform(weeks)
        weeks.each { |week| Marking::MarkWeek.perform week.id }

        if weeks.present?
          Marking::RefreshPositions.perform
          Marking::MarkFaBets.perform if TOGGLES_CONFIG['five_alive']
          Marking::MarkLmBets.perform if TOGGLES_CONFIG['last_man_standing']
          Marking::MarkLpBets.perform if TOGGLES_CONFIG['last_player_standing']
          Marking::MarkGbBets.perform if TOGGLES_CONFIG['goal_buster']
          Marking::MarkFatBets.perform if TOGGLES_CONFIG['five_alive_twist']
        end
      end

    end
  end
end
