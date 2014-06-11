module RakeTaskResources
  class AddFaBets
    class << self
      def perform
        FaBet.delete_all
        bets = [{ user_id: User.find_by_username('markm').id,  player_names: ['K Benzema', 'L Messi',     'Neymar Jr',    'J Rodriguez', 'L Suarez'    ] },
                { user_id: User.find_by_username('andyb').id,  player_names: ['S Aguero',  'Fred',        'L Messi',      'Neymar Jr',   'C Ronaldo'   ] },
                { user_id: User.find_by_username('ryans').id,  player_names: ['L Messi',   'Neymar Jr',   'W Rooney',     'C Ronaldo',   'F Torres'    ] },
                { user_id: User.find_by_username('davidb').id, player_names: ['K Benzema', 'E Dzeko',     'E Hazard',     'G Higuain',   'C Ronaldo'   ] },
                { user_id: User.find_by_username('samc').id,   player_names: ['K Benzema', 'R Lukaku',    'L Messi',      'Neymar Jr',   'C Ronaldo'   ] },
                { user_id: User.find_by_username('adams').id,  player_names: ['S Aguero',  'G Higuain',   'R Lukaku',     'Neymar Jr',   'C Ronaldo'   ] },
                { user_id: User.find_by_username('samt').id,   player_names: ['K Benzema', 'L Messi',     'M Balotelli',  'Fred',        'C Ronaldo'   ] },
                { user_id: User.find_by_username('stef').id,   player_names: ['S Aguero',  'T Muller',    'Neymar Jr',    'C Ronaldo',   'L Suarez'    ] },
                { user_id: User.find_by_username('dazm').id,   player_names: ['K Benzema', 'C Bacca',     'R Lukaku',     'L Messi',     'T Muller'    ] },
                { user_id: User.find_by_username('johns').id,  player_names: ['Fred',      'R Lukaku',    'L Messi',      'T Muller',    'Neymar Jr'   ] },
                { user_id: User.find_by_username('jonr').id,   player_names: ['R Lukaku',  'L Messi',     'Neymar Jr',    'C Ronaldo',   'D Sturridge' ] },
                { user_id: User.find_by_username('stec').id,   player_names: ['S Aguero',  'D Costa',     'J Drmic',      'R Lukaku',    'L Podolski'  ] },
                { user_id: User.find_by_username('liams').id,  player_names: ['S Aguero',  'L Messi',     'Neymar Jr',    'C Ronaldo',   'Y Toure'     ] },
                { user_id: User.find_by_username('sammyc').id, player_names: ['L Messi',   'Neymar Jr',   'C Ronaldo',    'D Sturridge', 'L Suarez'    ] },
                { user_id: User.find_by_username('steb').id,   player_names: ['S Aguero',  'T Muller',     'Neymar Jr',   'A Sanchez',   'L Suarez'    ] },
                { user_id: User.find_by_username('davem').id,  player_names: ['D Costa',   'T Gutierrez', 'L Messi',      'Neymar Jr',   'L Suarez'    ] },
                { user_id: User.find_by_username('peterm').id, player_names: ['K Benzema', 'Fred',        'M Gotze',      'G Higuain',   'Neymar Jr'   ] },
                { user_id: User.find_by_username('genec').id,  player_names: ['Fred',      'J Rodriguez', 'G Higuain',    'Neymar Jr',   'R van Persie'] },
                { user_id: User.find_by_username('davidm').id, player_names: ['D Costa',   'R Lukaku',    'L Messi',      'Neymar Jr',   'C Ronaldo'   ] },
                { user_id: User.find_by_username('neild').id,  player_names: ['K Benzema', 'A di Maria',  'A Robben',     'Y Toure',     'D Villa'     ] },
                { user_id: User.find_by_username('joshb').id,  player_names: ['Fred',      'L Messi',     'Neymar Jr',    'C Ronaldo',   'L Suarez'    ] },
                { user_id: User.find_by_username('chrisc').id, player_names: ['K Benzema', 'R Lukaku',    'L Messi',      'Neymar Jr',   'W Rooney'    ] },
                { user_id: User.find_by_username('mikea').id,  player_names: ['Fred',      'G Higuain',   'L Messi',      'Neymar Jr',   'L Suarez'    ] },
                { user_id: User.find_by_username('mickb').id,  player_names: ['M Gotze',   'L Messi',     'Neymar Jr',    'A Pirlo',     'C Ronaldo'   ] },
                { user_id: User.find_by_username('marks').id,  player_names: ['R Lukaku',  'L Messi',     'Neymar Jr',    'C Ronaldo',   'L Suarez'    ] }]

        bets.each do |bet|
          bet[:player_names].each do |player_name|
            FaBet.create(user_id: bet[:user_id], player_id: Player.find_by_name(player_name).id)
          end
        end
      end
    end
  end
end
