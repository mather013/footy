module RakeTaskResources
  class RefreshWinners
    class << self
      def perform
        puts 'refreshing winners'

        Winner.delete_all

        if ENVIRONMENT_CONFIG['winners_frequency'] == Winner::Frequency::WEEKLY
          undetermined = {}

          Week.sorted.where(complete: true).each do |week|
            weekly_points = week.points.order('value desc')

            unless weekly_points == []
              highest_score = weekly_points.first.value
              winning_points = weekly_points.where(value: highest_score)

              if winning_points.count == 1
                create_or_update_weekly_winners_record(winning_points.first)
              else
                undetermined.merge!(week.id.to_s => winning_points.collect(&:user_id))
              end

            end
          end
          process_undetermined(undetermined)
        else

          month_with_week_ids = {}
          Week.all.each { |w| month_with_week_ids[w.close_date.month].nil? ?
              month_with_week_ids[w.close_date.month] = [w.id] : month_with_week_ids[w.close_date.month] << w.id }

          month_with_week_ids.each do |month_id, week_ids|

            monthly_points = Point.total_points_for_weeks(week_ids)
            highest_score = monthly_points.first.total unless monthly_points==[]

            winning_points = []
            monthly_points.each do |point|
              winning_points << {user_id: point.user_id, total: point.total} if point.total == highest_score
            end
            create_or_update_monthly_winners_record(month_id, winning_points)
          end
        end
      end

      def create_or_update_weekly_winners_record(winning_point)
        winner = Winners::WeeklyWinner.find_by_number(winning_point.week_id)

        if winner.present?
          winner.update_attributes(user_id: winning_point.user_id, total: winning_point.value)
        else
          Winners::WeeklyWinner.create(user_id: winning_point.user_id, total: winning_point.value,
                                       number: winning_point.week_id)
        end
      end

      def create_or_update_monthly_winners_record(month_id, winning_points)
        winning_points.each do |winning_point|
          winner_hash = { user_id: winning_point[:user_id], total: winning_point[:total].to_i, number: month_id }
          Winners::MonthlyWinner.create(winner_hash)
        end
      end

      def process_undetermined(undetermined)
        undetermined.each do |week_id, user_ids|
          weeks = Week.sorted.where('complete = true and id > ?', week_id)

          weeks.each do |week|
            points = week.points.where('user_id in (?)', user_ids).sort_by { |k| k["value"] }.reverse
            if points.present?
              highest_score = points.first.value

              points.each do |point|
                user_ids = (user_ids - [point.user_id]) if point.value < highest_score
              end

              if user_ids.count == 1
                winning_point = Point.where(week_id: week_id.to_i, user_id: user_ids.first).first
                create_or_update_weekly_winners_record(winning_point)
                break
              end
            end
          end
        end

      end
    end
  end
end
