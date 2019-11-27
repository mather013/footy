module Bets
  class BetsCreator

    attr_accessor :user_id, :round_id, :chosen_selections

    def initialize(user_id, round_id, chosen_selections)
      @user_id = user_id
      @round_id = round_id
      @chosen_selections= chosen_selections
    end

    def perform
      bets = user_bets_for_round

      remove_all_unselected(bets, chosen_selections)
      create_all_selected(bets, chosen_selections)
    end

    def user_bets_for_round
      bet_class.for_user_and_round(user_id, round_id)
    end

    def remove_all_unselected(bets, selections)
      bets.select { |b| selections.exclude?(b.selection) }.map(&:delete)
    end

    def create_all_selected(bets, selections)
      selections.select { |selection| bets.map(&:selection).exclude?(selection) }.each do |selection|
        args = {user_id: user_id, selection: selection, round_id: round_id}
        bet = bet_class.new(args)
        bet.save!
      end
    end

  end
end
