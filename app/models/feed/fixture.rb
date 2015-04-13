module Feed
  class Fixture

    attr_accessor :id, :home_team_id, :away_team_id, :events, :score, :home_team_goals, :away_team_goals

    module Status
      FULL_TIME = 'FT'
    end

    def initialize(hash)
      @id = hash[:match_id].to_i
      @home_team_id = hash[:match_localteam_id].to_i
      @away_team_id = hash[:match_visitorteam_id].to_i
      @home_team_goals = hash[:match_ft_score].dup[1..-2].split('-').first.to_i unless hash[:match_ft_score].blank?
      @away_team_goals = hash[:match_ft_score].dup[1..-2].split('-').last.to_i unless hash[:match_ft_score].blank?
      @date = hash[:match_formatted_date]
      @time = hash[:match_time]
      @score = hash[:match_ft_score]
      @finished = hash[:match_status] == Status::FULL_TIME
      @events = Feed::Events.new(hash[:match_events])
    end

    def finished?
      @finished
    end

    def kickoff
      DateTime.parse("#{@date} #{@time}")
    end

  end
end
