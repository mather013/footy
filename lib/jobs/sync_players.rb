module Jobs
  class SyncPlayers

    def initialize(team_id)
      @team_id = team_id
    end

    def perform
      players_for_team_from_feed.each do |feed_player|
        player = Player.find_by(external_id: feed_player.id)
        player.present? ? player.update_attributes(params(feed_player)) : Player.create(params(feed_player))
      end
    end

    private

    def players_for_team_from_feed
      Feed::PlayersController.new.get_players_for(team)
    end

    def team
      @team ||= Team.find(@team_id)
    end

    def params(feed_player)
      {team_id: @team_id,
       surname: feed_player.surname,
       forename: feed_player.forename,
       squad_number: feed_player.squad_number,
       position: feed_player.position,
       external_id: feed_player.id}
    end

  end
end
