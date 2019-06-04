module Feed
  module FootballApi
    class Player

      attr_accessor :id, :surname, :forename, :squad_number, :position, :external_id

      module Position
        FORWARD = 'FW'
        MIDFIELDER = 'MF'
        DEFENDER = 'DF'
        GOALIE = 'GK'
        UNKNOWN = 'NA'
      end

      def initialize(hash)
        player_hash = hash[hash.keys.first]
        names = player_hash[:participant][:name].split
        @surname = names.last
        @forename = names.count > 1 ? names.first : ''
        @squad_number = player_hash[:properties][:value].to_i
        @position = Position::UNKNOWN
        @id = player_hash[:id].to_i
      end

    end
  end
end
