module RakeTaskResources
  class CreateFatBets
    class << self
      def perform(args)
        round = FatRound.find_or_create_by(week_id: args[:week_id])

        FatSelection.all.each do |selection|
          player_ids = selection.value.split(',').reject { |a| a.empty? }

          if player_ids.count == 5 then
            player_ids.each { |player_id| round.bets.create(user_id: selection.user_id, player_id: player_id) }
          end
        end

      end

    end
  end
end
