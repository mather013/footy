module Feed
  module FootballDataApi
    class Fixture

      attr_accessor :id, :home_team_id, :away_team_id, :events, :score, :home_team_goals, :away_team_goals

      module Status
        FULL_TIME = 'FINISHED'
      end

      def initialize(hash)
        @id = hash[:_links][:self][:href].split('/')[-1].to_i
        @home_team_id = hash[:_links][:homeTeam][:href].split('/')[-1].to_i
        @away_team_id = hash[:_links][:awayTeam][:href].split('/')[-1].to_i
        @home_team_goals = hash[:result][:goalsHomeTeam].to_i
        @away_team_goals = hash[:result][:goalsAwayTeam].to_i
        @date = Date.parse(hash[:date])
        @time = Time.parse(hash[:date])
        @score = "[#{hash[:result][:goalsHomeTeam]}-#{hash[:result][:goalsAwayTeam]}]"
        @finished = hash[:status] == Status::FULL_TIME
        @events = []
      end

      def finished?
        @finished
      end

      def kickoff
        DateTime.parse("#{@date} #{@time}")
      end

    end
  end
end

# == EXAMPLE ==

#{:_links=>
#     {:self=>{:href=>"http://api.football-data.org/v1/fixtures/147075"},
#      :soccerseason=>{:href=>"http://api.football-data.org/v1/soccerseasons/398"},
#      :homeTeam=>{:href=>"http://api.football-data.org/v1/teams/66"},
#      :awayTeam=>{:href=>"http://api.football-data.org/v1/teams/73"}},
# :date=>"2015-08-08T11:45:00Z",
# :status=>"FINISHED",
# :matchday=>1,
# :homeTeamName=>"Manchester United FC",
# :awayTeamName=>"Tottenham Hotspur FC",
# :result=>{:goalsHomeTeam=>1, :goalsAwayTeam=>0}}
