module Feed
  class Teams

    def initialize(hash)
      feed_service = TOGGLES_CONFIG['feed'].camelize.to_s
      feed_team_model = "Feed::#{feed_service}::Team".constantize
      @teams = hash.collect { |team| feed_team_model.new(team) } if hash.present?
    end

    def each(&block)
      @teams.each(&block) if @teams.present?
    end

  end
end
