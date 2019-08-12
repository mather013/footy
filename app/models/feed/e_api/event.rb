module Feed
  module EApi
    class Event

      attr_accessor :id, :event_type, :player_name, :team, :minute, :player_id

      RED_CARD_EVENT_TYPE_IDS = [15, 16]
      GOAL_CANCELLED_EVENT_TYPE_IDS = [33, 61, 62]
      MISSED_PENALTY_EVENT_TYPE_IDS = [9]

      module EventType
        CARD = 'card'
        GOAL = 'goal'
        ASSIST = 'assist'
        SUB_IN = 'subst_in'
        SUB_OUT = 'subst'
      end

      def initialize(hash)
        @id = hash[:id].to_i
        @event_type = fixture_event_type(hash[:incident_code], hash[:incident_typeFK].to_i)
        @player_id = hash[:participant][:id].to_i
        @player_name = hash[:participant][:name]
        @team = hash[:team]
        @minute = hash[:elapsed].to_i
      end

      def to_savable_hash
        hash = {}
        instance_variables.each { |var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
        hash.except('id','player_id')
      end

      def is_goal?
        event_type == EventType::GOAL
      end

      def by_home_team?
        team == 'localteam'
      end

      private

      def fixture_event_type(feed_event_type, feed_event_type_id)
        return 'redcard' if feed_event_type == EventType::CARD && RED_CARD_EVENT_TYPE_IDS.include?(feed_event_type_id)
        return 'yellowcard' if feed_event_type == EventType::CARD
        return 'assist' if feed_event_type == EventType::ASSIST
        return 'goal_cancelled' if feed_event_type == EventType::GOAL && GOAL_CANCELLED_EVENT_TYPE_IDS.include?(feed_event_type_id)
        return 'penalty_missed' if feed_event_type == EventType::GOAL && MISSED_PENALTY_EVENT_TYPE_IDS.include?(feed_event_type_id)
        return 'goal' if feed_event_type == EventType::GOAL
        return 'sub_in' if feed_event_type == EventType::SUB_IN
        return 'sub_out' if feed_event_type == EventType::SUB_OUT
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
