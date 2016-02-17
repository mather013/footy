module Feed
  class Events

    def initialize(hash)
      @events = hash.collect { |event| Feed::FootballApi::Event.new(event) } if hash.present?
    end

    def each(&block)
      @events.each(&block) if @events.present?
    end

  end
end
