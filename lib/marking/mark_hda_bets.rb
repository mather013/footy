module Marking
  class MarkHdaBets
    class << self
      def perform week_id
        puts "marking h/d/a round #{week_id}"
        @week = Week.find(week_id)
        @fixture_ids = @week.fixtures.collect { |fixture| fixture.id }.flatten
        @points = @week.points
        User.all.each do |user|
          bets = Bet.bets_for_user_and_fixtures(user, @fixture_ids)
          mark_footy_forecast user, bets unless bets.empty?
        end
        @week.maybe_mark_complete
      end

      private

      def mark_footy_forecast user, bets
        points = 0
        bonus_val = 0

        point = @points.select { |point| point[:user_id] == user.id }.first
        point.present? ? point.update_attributes(value: points) : point = Point.create(user_id: user.id, value: 0, week_id: @week.id)

        bets.each do |bet|
          points+=10 if bet.outcome == 'correct'
          points+=30 if bet.outcome == 'spot_on' unless TOGGLES_CONFIG['bet_type_hda']

          if TOGGLES_CONFIG['bonus_points']
            bonus_val += adjust_bonus(point, bet)
          end
        end

        points = points*2 if is_double_points_week?

        point.update_attributes(value: points+bonus_val, bonus: bonus_val)
      end

      def adjust_bonus(point, bet)
        bonus = point.bonuses.where(fixture_id: bet.fixture.id).first
        bonus_val = calculate_bonus(bet)

        if bonus_val > 0
          bonus.present? ? bonus.update_attributes(value: bonus_val) : point.bonuses.create(fixture_id: bet.fixture.id, value: bonus_val)
        else
          bonus.delete if bonus.present?
        end
        bonus_val
      end

      def calculate_bonus(bet)
        return 0 unless bet.outcome == 'correct' || bet.outcome == 'spot_on'
        bets = bet.fixture.bets.collect(&:value)
        correct_count = bets.count(bet.value)
        percentage = (correct_count.to_f / bets.count.to_f)*100

        percentage <= ENVIRONMENT_CONFIG['bonus_threshold'] ? bonus_amount : 0
      end

      def is_double_points_week?
        ENVIRONMENT_CONFIG['bonus_weeks'].include?(@week.id)
      end

      def bonus_amount
        amount = ENVIRONMENT_CONFIG['bonus_amount']
        is_double_points_week? ? amount*2 : amount
      end

    end
  end
end
