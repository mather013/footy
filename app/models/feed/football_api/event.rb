module Feed
  module FootballApi
    class Event

      attr_accessor :id, :event_type, :player_name, :team, :minute

      def initialize(hash)
        @id = hash[:id].to_i
        @event_type = hash[:type]
        @player_name = hash[:player]
        @team = hash[:team]
        @minute = hash[:minute].to_i
        # @player_id = hash[:player_id].to_i
        # @result = hash[:result]
      end

      def to_savable_hash
        hash = {}
        instance_variables.each { |var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
        hash.delete('id')
        hash
      end

    end
  end
end
