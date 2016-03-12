module Feed
  module FootballDataApi
    class Fixture

      attr_accessor :id, :home_team_id, :away_team_id, :events, :score, :home_team_goals, :away_team_goals, :status

      module Status
        TIMED = 'TIMED'
        FULL_TIME = 'FINISHED'
        POSTPONED = 'POSTPONED'
      end

      def initialize(hash)
        @id = hash[:_links][:self][:href].split('/')[-1].to_i
        @home_team_id = hash[:_links][:homeTeam][:href].split('/')[-1].to_i
        @away_team_id = hash[:_links][:awayTeam][:href].split('/')[-1].to_i
        @home_team_goals = hash[:result][:goalsHomeTeam].to_i
        @away_team_goals = hash[:result][:goalsAwayTeam].to_i
        @date = Date.parse(hash[:date])
        @time = Time.parse(hash[:date])
        @score = "[#{hash[:result][:goalsHomeTeam]}-#{hash[:result][:goalsAwayTeam]}]"
        @finished = hash[:status] == Status::FULL_TIME
        @events = []
        @status = hash[:status]
      end

      def finished?
        @finished
      end

      def kickoff
        DateTime.parse("#{@date} #{@time}")
      end

    end
  end
end
