module Jobs
  class MarkWeek
    class << self

      def perform(weeks)
        weeks.each { |week| Marking::MarkHdaBets.perform week.id }

        if weeks.present?
          Marking::RefreshPositions.perform
          Marking::MarkFaBets.perform if TOGGLES_CONFIG['five_alive']
          Marking::MarkLmBets.new.perform if TOGGLES_CONFIG['last_man_standing']
          Marking::MarkLpBets.new.perform if TOGGLES_CONFIG['last_player_standing']
          Marking::MarkGbBets.perform if TOGGLES_CONFIG['goal_buster']
          Marking::MarkFatBets.perform if TOGGLES_CONFIG['five_alive_twist']
          Marking::GoalsGaloreMarking.new.perform if TOGGLES_CONFIG['goals_galore']
        end
      end

    end

    def perform
      self.class.perform([Week.current])
    end

  end
end
