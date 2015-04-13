module Feed
  class Event

    attr_accessor :id, :event_type, :player_name, :team, :minute

    def initialize(hash)
      @id = hash[:event_id].to_i
      @event_type = hash[:event_type]
      @player_name = hash[:event_player]
      @team = hash[:event_team]
      @minute = hash[:event_minute].to_i
      #@match_id = hash[:event_match_id]
      #@player_id = hash[:event_player_id].to_i
      #@result = hash[:event_result]
    end

    def to_savable_hash
      hash = {}
      instance_variables.each { |var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
      hash.delete('id')
      hash
    end

  end
end
