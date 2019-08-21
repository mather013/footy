module Feed
  module EApi
    class Fixture

      attr_accessor :id, :home_team_id, :away_team_id, :events, :score, :home_team_goals, :away_team_goals, :status, :round_number

      module Status
        FINISHED = 'Finished'
        HALFTIME = 'Half Time'
        POSTPONED = 'Postponed'
        IN_PLAY = 'inprogress'
        FIRST_HALF = '1st half'
        SECOND_HALF = '2nd half'
        FINISHED_AET ='Finished AET'
      end

      def initialize(hash)
        @id = hash[:id].to_i
        @date = hash[:startdate]
        @status = common_status(hash[:status_type])

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
        @round_number= hash[:property].values.select { |p| p[:name].downcase == 'round' }.first[:value]

        if home_team_hash[:incident].present?
          home_team_events = home_team_hash[:incident].each.inject([]) do |h, event|
            event[1][:team]='localteam'
            h << event[1]
          end
        end

        if away_team_hash[:incident].present?
          away_team_events = away_team_hash[:incident].each.inject([]) do |h, event|
            event[1][:team]='visitorteam'
            h << event[1]
          end
        end

        formatted_events_hash = []
        formatted_events_hash << home_team_events if home_team_events
        formatted_events_hash << away_team_events if away_team_events
        @events = Feed::Events.new(formatted_events_hash.flatten)

        nil
      end

      def finished?
        status == Status::FINISHED
      end

      def kickoff
        DateTime.parse(@date)
      end

      private

      def common_status(feed_status)
        return ::Fixture::Status::IN_PLAY if in_play_status.include?(feed_status)
        return ::Fixture::Status::HALFTIME if halt_time_status.include?(feed_status)
        return ::Fixture::Status::FINISHED if full_time_status.include?(feed_status)
        ::Fixture::Status::SCHEDULED
      end

      def full_time_status
        [Status::FINISHED, Status::FINISHED_AET]
      end

      def in_play_status
        [Status::IN_PLAY, Status::FIRST_HALF, Status::SECOND_HALF]
      end

      def halt_time_status
        [Status::HALFTIME]
      end

    end
  end
end
