module Feed
  class Teams

    def initialize(hash)
      @teams = hash.collect { |team| Feed::FootballApi::Team.new(team) } if hash.present?
    end

    def each(&block)
      @teams.each(&block) if @teams.present?
    end

  end
end
