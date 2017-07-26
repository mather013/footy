module Feed
  class Players

    def initialize(hash)
      feed_service = TOGGLES_CONFIG['feed'].camelize.to_s
      feed_player_model = "Feed::#{feed_service}::Player".constantize
      @players = hash.collect { |player| feed_player_model.new(player) } if hash.present?
    end

    def each(&block)
      @players.each(&block) if @players.present?
    end

  end
end
