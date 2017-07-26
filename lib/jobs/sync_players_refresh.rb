module Jobs
  class SyncPlayersRefresh

    def perform
      Player.delete_all

      Team.all.each do |team|
        players_from_feed(team).each do |player|
          player_params = {surname: player.surname,
                           forename: player.forename,
                           squad_number: player.squad_number,
                           position: player.position,
                           team_id: team.id}

          Player.find_or_create_by(player_params)
        end
      end
    end

    private

    def players_from_feed(team)
      Feed::PlayersController.new.get_players_for(team)
    end

  end
end
