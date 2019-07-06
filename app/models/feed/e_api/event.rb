module Feed
  module EApi
    class Event

      attr_accessor :id, :event_type, :player_name, :team, :minute, :player_id

      module EventType
        CARD = 'card'
        GOAL = 'goal'
      end

      def initialize(hash)
        @id = hash[:id].to_i
        @event_type = fixture_event_type(hash[:incident_code])
        @player_id = hash[:participant][:id].to_i
        @player_name = hash[:participant][:name]
        @team = hash[:team]
        @minute = hash[:elapsed].to_i
      end

      def to_savable_hash
        hash = {}
        instance_variables.each { |var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
        hash.delete(:id)
        hash
      end

      private


      def fixture_event_type(feed_event_type)
        return 'yellowcard' if feed_event_type == EventType::CARD
        return 'goal' if feed_event_type == EventType::GOAL
      end

    end
  end
end

# {:id=>"6458524",
#  :event_participantsFK=>"10133902",
#  :incident_typeFK=>"7",
#  :incident_code=>"goal",
#  :elapsed=>"25",
#  :sortorder=>"0",
#  :n=>"1",
#  :ut=>"2019-06-05T19:11:48+00:00",
#  :ref_participantFK=>"30893",
#  :participant=>{:id=>"30893", :name=>"Cristiano Ronaldo", :gender=>"male", :type=>"athlete", :countryFK=>"12", :n=>"3", :ut=>"2018-06-06T10:13:44+00:00", :country_name=>"Portugal"}}
