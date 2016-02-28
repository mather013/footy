module Feed
  class Events

    def initialize(hash)
      feed_service = TOGGLES_CONFIG['feed'].camelize.to_s
      feed_events_model = "Feed::#{feed_service}::Event".constantize
      @events = hash.collect { |event| feed_events_model.new(event) } if hash.present?
    end

    def each(&block)
      @events.each(&block) if @events.present?
    end

  end
end
