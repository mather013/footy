module Markings
  class MarkSingleBets

    POINTS_FOR_WIN = 1
    POINTS_FOR_LOSS = 0

    def perform
      log('Marking')
      pending_bets.each do |bet|
        points = calc_points(bet)
        award_points(bet, points) unless points.nil?
        apply_result(bet, points) unless points.nil?
      end
      add_new_round if new_round_required?
    end

    def revert
      log('Reverting')
      point_class.delete_all
      bet_class.all.each { |b| b.update_attributes(result: BetSingle::Result::PENDING) }
    end

    private

    attr_reader :name, :bet_class, :round_class, :point_class, :new_round_resource

    def calc_points(bet)
      results = round_results(bet.round)
      return POINTS_FOR_WIN  if results[:winning_selections].include?(bet.selection)
      return POINTS_FOR_LOSS if results[:settle]
      nil
    end

    def pending_bets
      bet_class.pending
    end

    def award_points(bet, points)
      user_bet_point = find_or_create_user_point(bet)
      user_bet_point.add_points(points)
    end

    def apply_result(bet, points)
      points == POINTS_FOR_WIN ? bet.set_won : bet.set_lost
    end

    def new_round_required?
      round_class.last.week.id < Week.current.id
    end

    def add_new_round
      new_round_resource.perform
    end

    def round_results(round)
      @results_hash ||= {round.class.name => {round.id.to_s => round.results}}
      @results_hash[round.class.name][round.id.to_s] = round.results unless @results_hash[round.class.name][round.id.to_s]
      @results_hash[round.class.name][round.id.to_s]
    end

    def log(action)
      Rails.logger.info("#{'*'*20}\n#{action} #{name}\n#{'*'*20}")
    end

  end
end
