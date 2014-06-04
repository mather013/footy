module RakeTaskResources
  class MarkFaBets
    class << self
      def perform
        puts "marking 5 alive bets"
        puts "===================="
        User.all.each do |user|
          puts "marking #{user.username}"
          fa_bets = FaBet.find_all_by_user_id(user.id)
          mark_5_alive user, fa_bets unless fa_bets.empty?
        end
      end

      private

      def mark_5_alive user, fa_bets
        goals = 0

        fa_bets.each do |bet|
          goals += bet.player.goals.count
        end

        user.fa_point.present? ? user.fa_point.update_attributes(value: goals) : FaPoint.create(user_id: user.id, value: goals)
        puts "goals total: #{goals}"

      end
    end
  end
end
