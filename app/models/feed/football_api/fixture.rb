module Feed
  module FootballApi
    class Fixture

      attr_accessor :id, :home_team_id, :away_team_id, :events, :score, :home_team_goals, :away_team_goals, :status

      module Status
        FINISHED = 'FT'
        HALFTIME = 'HT'
        POSTPONED = 'POSTPONED'
      end

      def initialize(hash)
        @id = hash[:id].to_i
        @home_team_id = hash[:localteam_id].to_i
        @away_team_id = hash[:visitorteam_id].to_i
        @home_team_goals = hash[:localteam_score].to_i unless hash[:localteam_score].blank?
        @away_team_goals = hash[:visitorteam_score].to_i unless hash[:visitorteam_score].blank?
        @date = hash[:formatted_date]
        @time = hash[:time]
        @score = hash[:ft_score]
        @status = common_status hash[:status]
        @finished = hash[:status] == Status::FINISHED
        @events = Feed::Events.new(hash[:events])
      end

      def finished?
        @finished
      end

      def kickoff
        DateTime.parse("#{@date} #{@time}")
      end

      private

      def common_status feed_status
        return ::Fixture::Status::SCHEDULED if feed_status.include?(':')
        return ::Fixture::Status::FINISHED if feed_status == Status::FINISHED
        return ::Fixture::Status::HALFTIME if feed_status == Status::HALFTIME
        return ::Fixture::Status::IN_PLAY unless feed_status.include?(':')
        ::Fixture::Status::POSTPONED if feed_status == Status::POSTPONED
      end

    end
  end
end
