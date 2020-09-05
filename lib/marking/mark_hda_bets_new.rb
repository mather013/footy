module Marking
  class MarkHdaBetsNew < MarkSingleBets

    POINTS_FOR_WIN = 10.freeze
    POINTS_FOR_LOSS = 0.freeze

    def initialize(week_id)
      @name = 'HDA'
      @bet_class = Bet
      @round_class = Week
      @point_class = Point
      @week = Week.find(week_id)
    end

    def perform
      reset_points

      log('Marking')
      pending_bets.each do |bet|
        points = calc_points(bet)
        award_points(bet, points) unless points.nil?
        apply_result(bet, points) unless points.nil?
      end
      add_new_round if new_round_required?
      @week.maybe_mark_complete
    end

    private

    def reset_points
      @week.points.each { |point| point.update_attributes!(value: 0, bonus: 0) }
      @week.points.map(&:bonuses).flatten.each { |bonus| bonus.delete }
    end

    def award_points(bet, points)
      user_bet_point = find_or_create_user_point(bet)
      user_bet_point.add_points(points)
      user_bet_point.add_bonus(points, bet) if points[:bonus].to_i > 0
    end

    def find_or_create_user_point(bet)
      bet.user.points.where(week_id: @week.id).first ||= bet.user.points.create(value: 0, week_id: @week.id)
    end

    def pending_bets
      @week.fixtures.map(&:bets).flatten
    end

    def calc_points(bet)
      results = @week.results
      return nil if results[bet.fixture_id.to_s].nil?

      if results[bet.fixture_id.to_s] == bet.value
        bonus_val = calc_bonus(bet)
        {value: points_for_win+bonus_val, bonus: bonus_val}
      else
        {value: points_for_loss}
      end
    end

    def calc_bonus(bet)
      return 0 unless TOGGLES_CONFIG['bonus_points']

      bets = bet.fixture.bets.collect(&:value)
      correct_count = bets.count(bet.value)
      percentage = (correct_count.to_f / bets.count.to_f)*100

      percentage <= ENVIRONMENT_CONFIG['bonus_threshold'] ? ENVIRONMENT_CONFIG['bonus_amount'] : 0
    end

    def new_round_required?
      false
    end

    def add_new_round
      'ERROR'
    end

    def points_for_win
      POINTS_FOR_WIN
    end

    def points_for_loss
      POINTS_FOR_LOSS
    end

  end
end
