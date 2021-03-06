module Feed
  module FootballApi
    class Fixture

      attr_accessor :id, :home_team_id, :away_team_id, :events, :score, :home_team_goals, :away_team_goals, :status

      module Status
        FINISHED = 'FT'
        HALFTIME = 'HT'
        POSTPONED = 'POSTPONED'
      end

      POSTPONED_TIME = 'Postp.'

      def initialize(hash)
        @id = hash[:id].to_i
        @home_team_id = hash[:localteam_id].to_i
        @away_team_id = hash[:visitorteam_id].to_i
        @home_team_goals = hash[:localteam_score].to_i unless hash[:localteam_score].blank?
        @away_team_goals = hash[:visitorteam_score].to_i unless hash[:visitorteam_score].blank?
        @date = hash[:formatted_date]
        @time = hash[:time]
        @score = hash[:ft_score]
        @status = common_status(hash[:status], hash[:time])
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

      def common_status(feed_status, feed_time)
        return ::Fixture::Status::POSTPONED if feed_time == POSTPONED_TIME || feed_status == POSTPONED_TIME
        return ::Fixture::Status::FINISHED  if feed_status == Status::FINISHED
        return ::Fixture::Status::HALFTIME  if feed_status == Status::HALFTIME
        feed_status.present? && feed_status.match(number_regex).present? ? ::Fixture::Status::IN_PLAY : ::Fixture::Status::SCHEDULED
      end

      def number_regex
        /^[0-9]*$/
      end

    end
  end
end
