module RakeTaskResources
  class MarkWeek
    class << self
      def perform week_id
        puts "marking h/d/a round #{week_id}"
        @fixture_ids = get_fixtures_ids_for week_id
        User.all.each do |user|
          bets = Bet.bets_for_user_and_fixtures(user, @fixture_ids)
          mark_footy_forecast user, bets unless bets.empty?
        end
      end

      private

      def get_fixtures_ids_for week_id
        @week = Week.find(week_id)
        @week.fixtures.collect { |fixture| fixture.id }.flatten
      end

      def mark_footy_forecast user, bets
        points = 0

        bets.each do |bet|
          points+=10 if bet.outcome == 'correct'
          points+=30 if bet.outcome == 'spot_on' unless TOGGLES_CONFIG['bet_type_hda']
        end

        point=Point.point_for_user_and_week(user, @week).first
        point.present? ? point.update_attributes(value: points) : Point.create(user_id: user.id, value: points, week_id: @week.id)
      end
    end
  end
end
