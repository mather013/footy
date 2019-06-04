module Feed
  module EApi
    class Fixture

      attr_accessor :id, :home_team_id, :away_team_id, :events, :score, :home_team_goals, :away_team_goals, :status

      module Status
        FINISHED = 'Finished'
        HALFTIME = '??'
        POSTPONED = 'Postponed'
      end

      def initialize(hash)
        @id = hash[:id].to_i
        @date = hash[:startdate]
        @status = hash[:status_type]
        @finished = hash[:status] == Status::FINISHED

        home_team_hash = hash[:event_participants][hash[:event_participants].keys.first]
        away_team_hash = hash[:event_participants][hash[:event_participants].keys.last]

        @home_team_id = home_team_hash[:participantFK].to_i
        @away_team_id = away_team_hash[:participantFK].to_i

        home_team_hash[:result].keys.each do |result_id|
          if home_team_hash[:result][result_id.to_sym][:result_code] == 'ordinarytime'
            @home_team_goals = home_team_hash[:result][result_id.to_sym][:value]
          end
        end

        away_team_hash[:result].keys.each do |result_id|
          if away_team_hash[:result][result_id.to_sym][:result_code] == 'ordinarytime'
            @away_team_goals = away_team_hash[:result][result_id.to_sym][:value]
          end
        end

        @score = "#{@home_team_goals}-#{@away_team_goals}"
      end

      def finished?
        @finished
      end

      def kickoff
        DateTime.parse(@date)
      end

      private

      def common_status(feed_status)
        return ::Fixture::Status::POSTPONED if feed_status == POSTPONED_TIME
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
