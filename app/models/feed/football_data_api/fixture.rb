module Feed
  module FootballDataApi
    class Fixture

      attr_accessor :id, :home_team_id, :away_team_id, :events, :score, :home_team_goals, :away_team_goals, :status

      module Status
        TIMED = 'TIMED'
        IN_PLAY = 'IN_PLAY'
        FINISHED = 'FINISHED'
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
        @finished = hash[:status] == Status::FINISHED
        @events = []
        @status = common_status hash[:status]
      end

      def finished?
        @finished
      end

      def kickoff
        DateTime.parse("#{@date} #{@time}")
      end

      private

      def common_status feed_status
        return ::Fixture::Status::SCHEDULED if feed_status== Status::TIMED
        return ::Fixture::Status::IN_PLAY if feed_status== Status::IN_PLAY
        return ::Fixture::Status::FINISHED if feed_status == Status::FINISHED
        ::Fixture::Status::POSTPONED if feed_status == Status::POSTPONED
      end

    end
  end
end
