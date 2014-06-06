  Score.delete_all
  Goal.delete_all

  Score.create(id: 1, fixture_id: Fixture.find_by_name('BRA-CRO').id, home: 3, away: 0)
  Goal.create(score_id: 1, player_id: Player.find_by_name('Neymar Jr').id)
  Goal.create(score_id: 1, player_id: Player.find_by_name('Neymar Jr').id)
  Goal.create(score_id: 1, player_id: Player.find_by_name('Hulk').id)

  Score.create(id: 2, fixture_id: Fixture.find_by_name('MEX-CAM').id, home: 0, away: 1)
  Goal.create(score_id: 2, player_id: Player.find_by_name("S Eto'o").id)

  Score.create(id: 3, fixture_id: Fixture.find_by_name('SPA-NET').id, home: 2, away: 2)
  Goal.create(score_id: 3, player_id: Player.find_by_name('D Costa').id)
  Goal.create(score_id: 3, player_id: Player.find_by_name('F Torres').id)
  Goal.create(score_id: 3, player_id: Player.find_by_name('R van Persie').id)
  Goal.create(score_id: 3, player_id: Player.find_by_name('R van Persie').id)

  Score.create(id: 4, fixture_id: Fixture.find_by_name('CHI-AUS').id, home: 0, away: 0)

  Score.create(id: 5, fixture_id: Fixture.find_by_name('COL-GRE').id, home: 2, away: 0)
  Goal.create(score_id: 5, player_id: Player.find_by_name('R Falcao').id)
  Goal.create(score_id: 5, player_id: Player.find_by_name('R Falcao').id)

  Score.create(id: 6, fixture_id: Fixture.find_by_name('COT-JAP').id, home: 1, away: 0)
  Goal.create(score_id: 6, player_id: Player.find_by_name('Y Toure').id)

  Score.create(id: 7, fixture_id: Fixture.find_by_name('URU-COS').id, home: 3, away: 0)
  Goal.create(score_id: 7, player_id: Player.find_by_name('L Suarez').id)

  Score.create(id: 8, fixture_id: Fixture.find_by_name('ENG-ITA').id, home: 3, away: 1)
  Goal.create(score_id: 8, player_id: Player.find_by_name('D Sturridge').id)
  Goal.create(score_id: 8, player_id: Player.find_by_name('D Sturridge').id)
  Goal.create(score_id: 8, player_id: Player.find_by_name('W Rooney').id)
  Goal.create(score_id: 8, player_id: Player.find_by_name('M Balotelli').id)

  Score.create(id: 9, fixture_id: Fixture.find_by_name('SWI-ECU').id, home: 0, away: 0)

  Score.create(id: 10, fixture_id: Fixture.find_by_name('FRA-HON').id, home: 2, away: 0)
  Goal.create(score_id: 10, player_id: Player.find_by_name('O Giroud').id)
  Goal.create(score_id: 10, player_id: Player.find_by_name('O Giroud').id)

  Score.create(id: 11, fixture_id: Fixture.find_by_name('ARG-BOS').id, home: 3, away: 0)
  Goal.create(score_id: 11, player_id: Player.find_by_name('S Aguero').id)
  Goal.create(score_id: 11, player_id: Player.find_by_name('S Aguero').id)
  Goal.create(score_id: 11, player_id: Player.find_by_name('L Messi').id)

  Score.create(id: 12, fixture_id: Fixture.find_by_name('IRA-NIG').id, home: 0, away: 0)

  Score.create(id: 13, fixture_id: Fixture.find_by_name('GER-POR').id, home: 2, away: 3)
  Goal.create(score_id: 13, player_id: Player.find_by_name('L Podolski').id)
  Goal.create(score_id: 13, player_id: Player.find_by_name('M Reus').id)
  Goal.create(score_id: 13, player_id: Player.find_by_name('C Ronaldo').id)
  Goal.create(score_id: 13, player_id: Player.find_by_name('C Ronaldo').id)
  Goal.create(score_id: 13, player_id: Player.find_by_name('C Ronaldo').id)

  Score.create(id: 14, fixture_id: Fixture.find_by_name('GHA-USA').id, home: 0, away: 0)

  Score.create(id: 15, fixture_id: Fixture.find_by_name('BEL-ALG').id, home: 3, away: 0)
  Goal.create(score_id: 15, player_id: Player.find_by_name('R Lukaku').id)
  Goal.create(score_id: 15, player_id: Player.find_by_name('R Lukaku').id)
  Goal.create(score_id: 15, player_id: Player.find_by_name('E Hazard').id)

  Score.create(id: 16, fixture_id: Fixture.find_by_name('RUS-KOR').id, home: 0, away: 0)

  Score.create(id: 17, fixture_id: Fixture.find_by_name('BRA-MEX').id, home: 4, away: 0)
  Goal.create(score_id: 17, player_id: Player.find_by_name('Neymar Jr').id)
  Goal.create(score_id: 17, player_id: Player.find_by_name('Neymar Jr').id)
  Goal.create(score_id: 17, player_id: Player.find_by_name('Neymar Jr').id)
  Goal.create(score_id: 17, player_id: Player.find_by_name('Fred').id)

  Score.create(id: 18, fixture_id: Fixture.find_by_name('CAM-BRA').id, home: 1, away: 4)
  Goal.create(score_id: 18, player_id: Player.find_by_name('Neymar Jr').id)
  Goal.create(score_id: 18, player_id: Player.find_by_name('Neymar Jr').id)
  Goal.create(score_id: 18, player_id: Player.find_by_name('Fred').id)
  Goal.create(score_id: 18, player_id: Player.find_by_name('Fred').id)
  Goal.create(score_id: 18, player_id: Player.find_by_name("S Eto'o").id)
