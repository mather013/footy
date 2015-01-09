module RakeTaskResources
  class RefreshPositions
    class << self
      def perform
        puts "refresh user positions"
        puts "===================="
        index = 0
        position = 0
        previous_score = -10
        total_points = Point.find(:all, :select => 'user_id, count(*) as count, sum(value) as value', :group => 'user_id', :order => 'value DESC' )

        total_points.each do |point|
          position +=1 unless previous_score == point.value
          index += 1
          position = index unless previous_score == point.value
          record_position point.user_id, position
          previous_score = point.value
        end
      end

      def record_position user_id, current
        week = Week.current
        position = Position.find_by_user_id(user_id)

        if position.present?
          if position.last_marked_week_id < week.id
            previous=position.current
            position.update_attributes(current: current, previous: previous, last_marked_week_id: week.id)
          else
            position.update_attributes(current: current)
          end
        else
          Position.create(user_id: user_id, current: current, previous: current, last_marked_week_id: week.id)
        end

      end
    end
  end
end
