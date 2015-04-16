Goal.delete_all

if TOGGLES_CONFIG['five_alive']
  Score.create(id: 1, fixture_id: 1, home: 1, away: 1) #CHI-ECU
  Goal.create(score_id: 1, player_id: Player.where(surname: 'Sanchez', forename: 'A').first.id)
  Goal.create(score_id: 1, player_id: Player.where(surname: 'Valenica', forename: 'A').first.id)

  Score.create(id: 2, fixture_id: 2, home: 2, away: 1) #MEX-BOL
  Goal.create(score_id: 2, player_id: Player.where(surname: 'Hernandez', forename: 'J').first.id)
  Goal.create(score_id: 2, player_id: Player.where(surname: 'Hernandez', forename: 'J').first.id)
  Goal.create(score_id: 2, player_id: Player.where(surname: 'Arce', forename: 'J').first.id)

  Score.create(id: 3, fixture_id: 3, home: 3, away: 0) #URU-JAM
  Goal.create(score_id: 2, player_id: Player.where(surname: 'Suarez', forename: 'L').first.id)
  Goal.create(score_id: 2, player_id: Player.where(surname: 'Suarez', forename: 'L').first.id)
  Goal.create(score_id: 2, player_id: Player.where(surname: 'Suarez', forename: 'L').first.id)

  Score.create(id: 4, fixture_id: 4, home: 2, away: 1) #ARG-PAR
  Goal.create(score_id: 4, player_id: Player.where(surname: 'Messi', forename: 'L').first.id)
  Goal.create(score_id: 4, player_id: Player.where(surname: 'Messi', forename: 'L').first.id)
  Goal.create(score_id: 4, player_id: Player.where(surname: 'Cruz', forename: 'S la').first.id)

  Score.create(id: 5, fixture_id: 5, home: 1, away: 0) #COL-VEN
  Goal.create(score_id: 5, player_id: Player.where(surname: 'Rodriguez', forename: 'J').first.id)

  Score.create(id: 6, fixture_id: 6, home: 2, away: 1) #BRA-PER
  Goal.create(score_id: 6, player_id: Player.where(surname: 'Neymar Jr').first.id)
  Goal.create(score_id: 6, player_id: Player.where(surname: 'Oscar').first.id)
  Goal.create(score_id: 6, player_id: Player.where(surname: 'Avila', forename: 'I').first.id)
end
