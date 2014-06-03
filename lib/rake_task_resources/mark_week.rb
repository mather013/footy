module RakeTaskResources
  class MarkWeek
    class << self
      def perform week_id
        puts "marking bets round #{week_id}"
        puts "===================="
        @fixture_ids = get_fixtures_ids_for week_id
        User.all.each do |user|
          puts "marking #{user.username}"
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
          fixture_score = Fixture.find(bet.fixture_id).score
          if fixture_score.present?
            if bet.value == fixture_score.outcome
              points +=10
            end
          end
        end

        point=Point.point_for_user_and_week(user, @week).first

        if point.present?
          point.update_attributes(:value => points)
        else
          Point.create(:user_id => user.id, :value => points, :week_id => @week.id)
        end
        puts "Points total: #{points}"
      end
    end
  end
end
