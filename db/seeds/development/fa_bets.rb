FaBet.delete_all
bets = [{ user_id: 1, player_names: ['L Messi',   'Neymar Jr',   'M Reus',    'C Ronaldo', 'D Sturridge'] },
        { user_id: 2, player_names: ['S Aguero',  'D Costa',     'T Muller',  'Neymar Jr', 'C Ronaldo'  ] },
        { user_id: 3, player_names: ['L Messi',   'Neymar Jr',   'W Rooney',  'C Ronaldo', 'F Torres'   ] },
        { user_id: 4, player_names: ['K Benzema', 'E Dzeko',     'R Falcao',  'E Hazard',  'T Muller'   ] },
        { user_id: 5, player_names: ['K Benzema', 'R Lukaku',    'L Messi',   'Neymar Jr', 'C Ronaldo'  ] },
        { user_id: 6, player_names: ['S Aguero',  'G Higuain',   'R Lukaku',  'Neymar Jr', 'C Ronaldo'  ] },
        { user_id: 7, player_names: ['S Aguero',  'M Balotelli', 'Fred',      'T Muller',  'C Ronaldo'  ] },
        { user_id: 8, player_names: ['S Aguero',  'T Muller',    'Neymar Jr', 'C Ronaldo', 'L Suarez'   ] },
        { user_id: 9, player_names: ['K Benzema', 'R Falcao',    'R Lukaku',  'L Messi',   'T Muller'   ] }]

bets.each do |bet|
  bet[:player_names].each do |player_name|
    FaBet.create(user_id: bet[:user_id], player_id: Player.find_by_name(player_name).id)
  end
end
