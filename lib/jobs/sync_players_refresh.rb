module Jobs
  class SyncPlayersRefresh

    def perform
      Player.delete_all

      Team.all.each do |team|
        players_from_feed(team).each do |feed_player|
          player_params = {surname: feed_player.surname,
                           forename: feed_player.forename,
                           squad_number: feed_player.squad_number,
                           position: feed_player.position,
                           external_id: feed_player.id,
                           team_id: team.id}

          Player.create(player_params) if feed_player.surname.present?
        end
      end
    end

    private

    def players_from_feed(team)
      Feed::PlayersController.new.get_players_for(team)
    end

  end
end
