module Feed
  module EApi
    class Player

      attr_accessor :id, :surname, :forename, :squad_number, :position

      module Position
        FORWARD = 'FW'
        MIDFIELDER = 'MF'
        DEFENDER = 'DF'
        GOALIE = 'GK'
        UNKNOWN = 'NA'
      end

      def initialize(hash)
        player_hash = hash[:participant].values.first
        return if player_hash[:type] != 'athlete'
        names = player_hash[:name].split
        @surname = names.last
        @forename = names.count > 1 ? names.first : ''
        @squad_number = hash[:properties].values.first[:value] unless hash[:properties].nil?
        @position = Position::UNKNOWN
        @id = player_hash[:id].to_i
      end

    end
  end
end
