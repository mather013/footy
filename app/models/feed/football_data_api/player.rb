module Feed
  module FootballDataApi
    class Player

      attr_accessor :id, :surname, :forename, :squad_number, :position, :dob, :nationality

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
        @squad_number = hash[:jerseyNumber].to_i
        @position = get_position(hash[:position])
        @dob = Time.parse(hash[:dateOfBirth])
        @nationality = hash[:nationality]
      end

      private

      def get_position(position)
        case position.downcase
          when 'keeper'
            Position::GOALIE
          when 'left-back','right-back','centre-back'
            Position::DEFENDER
          when 'defensive midfield', 'central midfield', 'right midfield', 'left midfield', 'attacking midfield', 'right wing','left wing'
            Position::MIDFIELDER
          when 'secondary striker', 'centre-forward'
            Position::FORWARD
          else
            Position::UNKNOWN
        end
      end
    end
  end
end
