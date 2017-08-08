module RakeTaskResources
  class ProcessPlayerUpdates
    class << self

      def perform
        # deletes.each { |del| Player.find_by(reference: del[:current_reference].upcase).delete }

        # additions.each do |add|
        #   team = Team.find_by(abbreviation: add[:team_abbreviation])
        #   Player.create(add[:create_params].merge({team_id: team.id}))
        # end

        # updates.each do |upd|
        #   team = Team.find_by(abbreviation: upd[:team_abbreviation])
        #   player = Player.find_by(reference: upd[:current_reference].upcase)
        #   player.update_attributes(squad_number: upd[:squad_number], team_id: team.id)
        # end

        bri_players.each do |add|
          team = Team.find_by(abbreviation: add[:team_abbreviation])
          Player.create(add[:create_params].merge({team_id: team.id}))
        end

        hud_players.each do |add|
          team = Team.find_by(abbreviation: add[:team_abbreviation])
          Player.create(add[:create_params].merge({team_id: team.id}))
        end

      end

      private

      def additions
        [
            {team_abbreviation: 'ars', create_params: { squad_number: '101', position: 'FW', forename: 'Alexandre', surname: 'Lacazette'} },
            {team_abbreviation: 'bou', create_params: { squad_number: '102', position: 'FW', forename: 'Jermain', surname: 'Defoe'} },
            {team_abbreviation: 'bou', create_params: { squad_number: '103', position: 'MF', forename: 'Connor', surname: 'Mahoney'} },
            {team_abbreviation: 'bur', create_params: { squad_number: '104', position: 'DF', forename: 'Charlie', surname: 'Taylor'} },
            {team_abbreviation: 'che', create_params: { squad_number: '105', position: 'MF', forename: 'Ethan', surname: 'Ampadu'} },
            {team_abbreviation: 'che', create_params: { squad_number: '106', position: 'MF', forename: 'Tiemoue', surname: 'Bakayoko'} },
            {team_abbreviation: 'che', create_params: { squad_number: '107', position: 'GK', forename: 'Willy', surname: 'Caballero'} },
            {team_abbreviation: 'che', create_params: { squad_number: '108', position: 'FW', forename: 'Alvaro', surname: 'Morata'} },
            {team_abbreviation: 'che', create_params: { squad_number: '109', position: 'DF', forename: 'Antonio', surname: 'Rudiger'} },
            {team_abbreviation: 'cry', create_params: { squad_number: '110', position: 'DF', forename: 'Jairo', surname: 'Riedewald'} },
            {team_abbreviation: 'eve', create_params: { squad_number: '111', position: 'FW', forename: 'Sandro', surname: 'Ramirez'} },
            {team_abbreviation: 'eve', create_params: { squad_number: '112', position: 'FW', forename: 'Henry', surname: 'Onyekuru'} },
            {team_abbreviation: 'eve', create_params: { squad_number: '113', position: 'DF', forename: 'Cuco', surname: 'Martina'} },
            {team_abbreviation: 'eve', create_params: { squad_number: '114', position: 'MF', forename: 'Davy', surname: 'Klaassen'} },
            {team_abbreviation: 'eve', create_params: { squad_number: '115', position: 'GK', forename: 'Jordan', surname: 'Pickford'} },
            {team_abbreviation: 'lei', create_params: { squad_number: '116', position: 'MF', forename: 'Vicente', surname: 'Iborra'} },
            {team_abbreviation: 'lei', create_params: { squad_number: '117', position: 'GK', forename: 'Eldin', surname: 'Jakupovic'} },
            {team_abbreviation: 'lei', create_params: { squad_number: '118', position: 'DF', forename: 'Harry', surname: 'Maguire'} },
            {team_abbreviation: 'liv', create_params: { squad_number: '119', position: 'MF', forename: 'Mohamed', surname: 'Salah'} },
            {team_abbreviation: 'liv', create_params: { squad_number: '120', position: 'DF', forename: 'Andrew', surname: 'Robertson'} },
            {team_abbreviation: 'mci', create_params: { squad_number: '121', position: 'DF', forename: '', surname: 'Danilo'} },
            {team_abbreviation: 'mci', create_params: { squad_number: '122', position: 'DF', forename: 'Benjamin', surname: 'Mendy'} },
            {team_abbreviation: 'mun', create_params: { squad_number: '123', position: 'DF', forename: 'Victor', surname: 'Lindelof'} },
            {team_abbreviation: 'new', create_params: { squad_number: '124', position: 'DF', forename: 'Florian', surname: 'Lejeune'} },
            {team_abbreviation: 'new', create_params: { squad_number: '125', position: 'DF', forename: 'Javi', surname: 'Manquillo'} },
            {team_abbreviation: 'new', create_params: { squad_number: '126', position: 'MF', forename: 'Jacob', surname: 'Murphy'} },
            {team_abbreviation: 'new', create_params: { squad_number: '127', position: 'DF', forename: 'Stefan', surname: "O'Connor"} },
            {team_abbreviation: 'new', create_params: { squad_number: '128', position: 'DF', forename: 'Josef', surname: 'Yarney'} },
            {team_abbreviation: 'sou', create_params: { squad_number: '129', position: 'DF', forename: 'Jan', surname: 'Bednarek'} },
            {team_abbreviation: 'sto', create_params: { squad_number: '130', position: 'DF', forename: 'Josh', surname: 'Tymon'} },
            {team_abbreviation: 'swa', create_params: { squad_number: '131', position: 'MF', forename: 'Roque Mesa', surname: 'Quevedo'} },
            {team_abbreviation: 'swa', create_params: { squad_number: '132', position: 'DF', forename: 'Cian', surname: 'Harries'} },
            {team_abbreviation: 'wat', create_params: { squad_number: '133', position: 'GK', forename: 'Daniel', surname: 'Bachmann'} },
            {team_abbreviation: 'wat', create_params: { squad_number: '134', position: 'MF', forename: 'Kiko', surname: 'Femenia'} },
            {team_abbreviation: 'wat', create_params: { squad_number: '135', position: 'MF', forename: 'Will', surname: 'Hughes'} },
            {team_abbreviation: 'wbr', create_params: { squad_number: '136', position: 'FW', forename: 'Zhang', surname: 'Yuning'} },
            {team_abbreviation: 'wha', create_params: { squad_number: '137', position: 'FW', forename: 'Javier', surname: 'Hernandez'} },
            {team_abbreviation: 'wbr', create_params: { squad_number: '138', position: 'DF', forename: 'Ahmed', surname: 'Hegazy'} },
            {team_abbreviation: 'swa', create_params: { squad_number: '144', position: 'FW', forename: 'Tammy', surname: 'Abraham'} },
        ]
      end

      def updates
        [
            {current_reference: 'eve10', team_abbreviation: 'mun', squad_number: '202'}, # romelu lukaku
            {current_reference: 'mun10', team_abbreviation: 'eve', squad_number: '203'}, # wayne rooney
            {current_reference: 'bur5',  team_abbreviation: 'eve', squad_number: '204'}, # michael keane
            {current_reference: 'tot2',  team_abbreviation: 'mci', squad_number: '205'}, # kyle walker
            {current_reference: 'che6',  team_abbreviation: 'bou', squad_number: '206'}, # nathan ake
            {current_reference: 'sto19', team_abbreviation: 'bur', squad_number: '207'}, # jonathan walters
            {current_reference: 'sto2',  team_abbreviation: 'bur', squad_number: '208'}, # phil bardsley
            {current_reference: 'swa24', team_abbreviation: 'bur', squad_number: '209'}, # jack cork
            {current_reference: 'sou9',  team_abbreviation: 'wbr', squad_number: '210'}, # jay rodríguez
            {current_reference: 'che5',  team_abbreviation: 'sto', squad_number: '211'}, # kurt zouma
            {current_reference: 'sto10', team_abbreviation: 'wha', squad_number: '212'}, # marko arnautovic Chalobah
            {current_reference: 'che29', team_abbreviation: 'wat', squad_number: '213'}, # nathaniel chalobah
            {current_reference: 'che21', team_abbreviation: 'mun', squad_number: '214'}, # nemanja matic
            {current_reference: 'mci72', team_abbreviation: 'lei', squad_number: '215'}, # kelechi iheanacho
        ]
      end

      def deletes
        [
            {current_reference: 'liv21'}, # lucas leiva
            {current_reference: 'liv35'}, # kevin stewart
            {current_reference: 'mci11'}, # alexander kolorov
            {current_reference: 'mci9'},  # nolito
            {current_reference: 'bur21'}, # george boyd
            {current_reference: 'bur17'}, # paul robinson
            {current_reference: 'cry30'}, # steve mandanda
            {current_reference: 'lei21'}, # ron-robert zieler
            {current_reference: 'new34'}, # sammy ameobi
            {current_reference: 'new8'},  # vurnon anita
            {current_reference: 'new20'}, # yoan gouffran
            {current_reference: 'new33'}, # daryl murphy
            {current_reference: 'new0'},  # haris vuckic
            {current_reference: 'wha24'}, # ashley fletcher
            {current_reference: 'wha4'},  # havard nordtveit
            {current_reference: 'wha1'},  # darren randolph
            {current_reference: 'che26'}, # john terry
        ]
      end

      def hud_players
        [
            {team_abbreviation: 'hud', create_params: {squad_number: '1',  position: 'GK', forename: 'Jonas', surname: 'Lössl'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '13', position: 'GK', forename: 'Joel', surname: 'Coleman'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '31', position: 'GK', forename: 'Ryan', surname: 'Schofield'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '139',position: 'GK', forename: 'Luke', surname: 'Coddington'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '2',  position: 'DF', forename: 'Tommy', surname: 'Smith'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '3',  position: 'DF', forename: 'Scott', surname: 'Malone'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '5',  position: 'DF', forename: 'Mark', surname: 'Hudson'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '14', position: 'DF', forename: 'Martin', surname: 'Cranie'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '15', position: 'DF', forename: 'Chris', surname: 'Löwe'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '25', position: 'DF', forename: 'Mathais', surname: 'Jorgensen'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '26', position: 'DF', forename: 'Christopher', surname: 'Schindler'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '27', position: 'DF', forename: 'Jon', surname: 'Stanković'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '44', position: 'DF', forename: 'Michael', surname: 'Hefele'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '4',  position: 'MF', forename: 'Dean', surname: 'Whitehead'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '6',  position: 'MF', forename: 'Jonathan', surname: 'Hogg'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '7',  position: 'MF', forename: 'Sean', surname: 'Scannell'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '8',  position: 'MF', forename: 'Philip', surname: 'Billing'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '10', position: 'MF', forename: 'Aaron', surname: 'Mooy'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '16', position: 'MF', forename: 'Jack', surname: 'Payne'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '17', position: 'MF', forename: 'Rajiv', surname: 'van La Parra'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '18', position: 'MF', forename: 'Joe', surname: 'Lolley'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '19', position: 'MF', forename: 'Danny', surname: 'Williams'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '22', position: 'MF', forename: 'Tom', surname: 'Ince'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '140',position: 'MF', forename: 'Regan', surname: 'Booty'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '9',  position: 'FW', forename: 'Elias', surname: 'Kachunga'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '20', position: 'FW', forename: 'Laurent', surname: 'Depoitre'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '21', position: 'FW', forename: 'Nahki', surname: 'Wells'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '23', position: 'FW', forename: 'Collin', surname: 'Quaner'}},
            {team_abbreviation: 'hud', create_params: {squad_number: '24', position: 'FW', forename: 'Steve', surname: 'Mounié'}},
        ]
      end

      def bri_players
        [
            {team_abbreviation: 'bri', create_params: {squad_number: '1',  position: 'GK', forename: 'Mathew', surname: 'Ryan'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '12', position: 'GK', forename: 'Niki', surname: 'Mäenpää'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '2',  position: 'DF', forename: '', surname: 'Bruno'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '3',  position: 'DF', forename: 'Gaëtan', surname: 'Bong'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '4',  position: 'DF', forename: 'Uwe', surname: 'Hünemeier'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '5',  position: 'DF', forename: 'Lewis', surname: 'Dunk '}},
            {team_abbreviation: 'bri', create_params: {squad_number: '18', position: 'DF', forename: 'Connor', surname: 'Goldson'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '22', position: 'DF', forename: 'Shane', surname: 'Duffy'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '23', position: 'DF', forename: 'Liam', surname: 'Rosenior'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '29', position: 'DF', forename: 'Markus', surname: 'Suttner'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '141',position: 'DF', forename: 'Aleš', surname: 'Matějů'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '6',  position: 'MF', forename: 'Dale', surname: 'Stephens'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '7',  position: 'MF', forename: 'Beram', surname: 'Kayal'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '8',  position: 'MF', forename: 'Jiří', surname: 'Skalák'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '11', position: 'MF', forename: 'Knockaert', surname: 'Anthony'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '13', position: 'MF', forename: 'Pascal', surname: 'Groß'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '14', position: 'MF', forename: 'Steve', surname: 'Sidwell'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '20', position: 'MF', forename: 'Solly', surname: 'March'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '24', position: 'MF', forename: 'Rohan', surname: 'Ince'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '27', position: 'MF', forename: 'Richie', surname: 'Towell'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '30', position: 'MF', forename: 'Kazenga', surname: 'LuaLua'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '142',position: 'MF', forename: '', surname: ''}},
            {team_abbreviation: 'bri', create_params: {squad_number: '9',  position: 'FW', forename: 'Sam', surname: 'Baldock'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '10', position: 'FW', forename: 'Tomer', surname: 'Hemed'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '15', position: 'FW', forename: 'Jamie', surname: 'Murphy'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '17', position: 'FW', forename: 'Glenn', surname: 'Murray'}},
            {team_abbreviation: 'bri', create_params: {squad_number: '143',position: 'FW', forename: 'Davy', surname: 'Pröpper'}},
        ]
      end

    end
  end
end
