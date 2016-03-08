module Feed
  module FootballDataApi
    class Team

      attr_accessor :id, :form, :form_score, :points, :position, :name, :played, :goals

      def initialize(hash)
        @id = hash[:_links][:team][:href].split('/')[-1].to_i
        @name = hash[:teamName]
        @form = nil
        @form_score = 0
        @points = hash[:points].to_i
        @position = hash[:position].to_i
        @played = hash[:playedGames]
        @goals = { for: hash[:goals], against: hash[:goalsAgainst], difference: hash[:goalDifference] }
      end

    end
  end
end
