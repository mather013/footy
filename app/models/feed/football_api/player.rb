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
        names = hash[:name].split
        @surname = names.last
        @forename = names.count > 1 ? names.first : ''
        @squad_number = hash[:number].to_i
        @position = get_position(hash[:position])
        @external_id = hash[:id].to_i
      end

      private

      def get_position(position)
        case position.downcase
          when 'g'
            Position::GOALIE
          when 'd'
            Position::DEFENDER
          when 'm'
            Position::MIDFIELDER
          when 'a'
            Position::FORWARD
          else
            Position::UNKNOWN
        end
      end
    end
  end
end
