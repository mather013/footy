module Feed
  class Fixtures

    def initialize(hash)
      @fixtures = hash.collect { |fixture| Feed::FootballApi::Fixture.new(fixture) } if hash.present?
    end

    def each(&block)
      @fixtures.each(&block) if @fixtures.present?
    end

  end
end
