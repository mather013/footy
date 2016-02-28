module Feed
  module FootballDataApi
    class Team

      attr_accessor :id, :form, :form_score, :points, :position, :name

      def initialize(hash)
        @id = hash[:_links][:team][:href].split('/')[-1].to_i
        @name = hash[:teamName]
        @form = nil
        @form_score = 0
        @points = hash[:points].to_i
        @position = hash[:position].to_i
      end

    end
  end
end

# == EXAMPLE ==

#{:_links=>{:team=>{:href=>"http://api.football-data.org/v1/teams/58"}},
# :position=>20,
# :teamName=>"Aston Villa FC",
# :crestURI=>
#     "http://upload.wikimedia.org/wikipedia/de/9/9f/Aston_Villa_logo.svg",
# :playedGames=>26,
# :points=>16,
# :goals=>20,
# :goalsAgainst=>46,
# :goalDifference=>-26,
# :wins=>3,
# :draws=>7,
# :losses=>16,
# :home=>{:goals=>10, :goalsAgainst=>20, :wins=>2, :draws=>4, :losses=>7},
# :away=>{:goals=>10, :goalsAgainst=>26, :wins=>1, :draws=>3, :losses=>9}}
