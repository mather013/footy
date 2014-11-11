module Feed
  class Fixture

    module Status
      FULL_TIME = "FT"
    end

    def initialize(hash)
      @data = hash
    end

    def id
      @data[:match_id]
    end

    def home_team_id
      @data[:match_localteam_id]
    end

    def away_team_id
      @data[:match_visitorteam_id]
    end

    def match_date
      @data[:match_formatted_date]
    end

    def match_time
      @data[:match_time]
    end

    def events
      @data[:match_events]
    end

    def score
      @data[:match_ft_score]
    end

    def finished?
      @data[:match_status] == Status::FULL_TIME
    end

  end
end
