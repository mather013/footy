module RakeTaskResources
  class MarkWeekComplete
    class << self

      def perform week_id
        Week.find(week_id).update_attributes(complete: true)
      end

    end
  end
end
