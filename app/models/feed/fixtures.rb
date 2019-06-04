module Feed
  class Fixtures

    def initialize(hash)
      feed_service = TOGGLES_CONFIG['feed'].camelize.to_s
      feed_fixture_model = "Feed::#{feed_service}::Fixture".constantize
      @fixtures = hash.collect { |fixture| feed_fixture_model.new(fixture) } if hash.present?
    end

    def each(&block)
      @fixtures.each(&block) if @fixtures.present?
    end

    def all
      @fixtures.each.inject([]) { |fixtures, fixture| fixtures << fixture }
    end

  end
end
