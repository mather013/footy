module Feed
  class Fixtures

    def initialize(hash)
      @fixtures = hash.collect { |fixture| Feed::Fixture.new(fixture) }
    end
  end
end
