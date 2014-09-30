  Score.delete_all
  Goal.delete_all

  Score.create(id: 1,  fixture_id: 1,  home: 1, away: 0)
  Score.create(id: 2,  fixture_id: 2,  home: 2, away: 0)
  Score.create(id: 3,  fixture_id: 3,  home: 3, away: 0)
  Score.create(id: 4,  fixture_id: 4,  home: 4, away: 0)
  Score.create(id: 5,  fixture_id: 5,  home: 0, away: 0)
  Score.create(id: 6,  fixture_id: 6,  home: 3, away: 1)
  Score.create(id: 7,  fixture_id: 7,  home: 2, away: 2)
  Score.create(id: 8,  fixture_id: 8,  home: 1, away: 0)
  Score.create(id: 9,  fixture_id: 9,  home: 3, away: 1)
  Score.create(id: 10, fixture_id: 10, home: 2, away: 4)

  Score.create(id: 11, fixture_id: 11, home: 1, away: 0)
  Score.create(id: 12, fixture_id: 12, home: 0, away: 0)
  Score.create(id: 13, fixture_id: 13, home: 3, away: 0)
  Score.create(id: 14, fixture_id: 14, home: 1, away: 2)
  Score.create(id: 15, fixture_id: 15, home: 0, away: 0)
  Score.create(id: 16, fixture_id: 16, home: 3, away: 4)
  Score.create(id: 17, fixture_id: 17, home: 2, away: 2)
  Score.create(id: 18, fixture_id: 18, home: 1, away: 0)
  Score.create(id: 19, fixture_id: 19, home: 3, away: 1)
  Score.create(id: 20, fixture_id: 20, home: 2, away: 4)

  Score.create(id: 21, fixture_id: 21, home: 1, away: 0)
  Score.create(id: 22, fixture_id: 22, home: 2, away: 2)
  Score.create(id: 23, fixture_id: 23, home: 3, away: 0)
  Score.create(id: 24, fixture_id: 24, home: 1, away: 2)
  Score.create(id: 25, fixture_id: 25, home: 0, away: 0)
  Score.create(id: 26, fixture_id: 26, home: 3, away: 1)
  Score.create(id: 27, fixture_id: 27, home: 2, away: 2)
  Score.create(id: 28, fixture_id: 28, home: 1, away: 0)
  Score.create(id: 29, fixture_id: 29, home: 3, away: 4)
  Score.create(id: 30, fixture_id: 30, home: 2, away: 4)

  Score.create(id: 31, fixture_id: 31, home: 1, away: 2)
  Score.create(id: 32, fixture_id: 32, home: 2, away: 0)
  Score.create(id: 33, fixture_id: 33, home: 3, away: 0)
  Score.create(id: 34, fixture_id: 34, home: 1, away: 2)
  Score.create(id: 35, fixture_id: 35, home: 0, away: 0)
  Score.create(id: 36, fixture_id: 36, home: 3, away: 1)
  Score.create(id: 37, fixture_id: 37, home: 2, away: 2)
  Score.create(id: 38, fixture_id: 38, home: 1, away: 0)
  Score.create(id: 39, fixture_id: 39, home: 3, away: 4)
  Score.create(id: 40, fixture_id: 40, home: 2, away: 4)


  #Score.create(id: 1, fixture_id: Fixture.find_by_name('BRA-CRO').id, home: 3, away: 0)
  #Goal.create(score_id: 1, player_id: Player.find_by_name('Neymar Jr').id)
  #Goal.create(score_id: 1, player_id: Player.find_by_name('Neymar Jr').id)
  #Goal.create(score_id: 1, player_id: Player.find_by_name('Hulk').id)
  #
  #Score.create(id: 2, fixture_id: Fixture.find_by_name('MEX-CAM').id, home: 0, away: 1)
  #Goal.create(score_id: 2, player_id: Player.find_by_name("S Eto'o").id)
  #
  #Score.create(id: 3, fixture_id: Fixture.find_by_name('SPA-NET').id, home: 2, away: 2)
  #Goal.create(score_id: 3, player_id: Player.find_by_name('D Costa').id)
  #Goal.create(score_id: 3, player_id: Player.find_by_name('F Torres').id)
  #Goal.create(score_id: 3, player_id: Player.find_by_name('R van Persie').id)
  #Goal.create(score_id: 3, player_id: Player.find_by_name('R van Persie').id)
  #
  #Score.create(id: 4, fixture_id: Fixture.find_by_name('CHI-AUS').id, home: 0, away: 0)
  #
  #Score.create(id: 5, fixture_id: Fixture.find_by_name('COL-GRE').id, home: 2, away: 0)
  #Goal.create(score_id: 5, player_id: Player.find_by_name('J Rodriguez').id)
  #Goal.create(score_id: 5, player_id: Player.find_by_name('J Rodriguez').id)
  #
  #Score.create(id: 6, fixture_id: Fixture.find_by_name('COT-JAP').id, home: 1, away: 0)
  #Goal.create(score_id: 6, player_id: Player.find_by_name('Y Toure').id)
  #
  #Score.create(id: 7, fixture_id: Fixture.find_by_name('URU-COS').id, home: 3, away: 0)
  #Goal.create(score_id: 7, player_id: Player.find_by_name('L Suarez').id)
  #Goal.create(score_id: 7, player_id: Player.find_by_name('L Suarez').id)
  #
  #Score.create(id: 8, fixture_id: Fixture.find_by_name('ENG-ITA').id, home: 3, away: 1)
  #Goal.create(score_id: 8, player_id: Player.find_by_name('D Sturridge').id)
  #Goal.create(score_id: 8, player_id: Player.find_by_name('D Sturridge').id)
  #Goal.create(score_id: 8, player_id: Player.find_by_name('W Rooney').id)
  #Goal.create(score_id: 8, player_id: Player.find_by_name('M Balotelli').id)
  #
  #Score.create(id: 9, fixture_id: Fixture.find_by_name('SWI-ECU').id, home: 0, away: 0)
  #
  #Score.create(id: 10, fixture_id: Fixture.find_by_name('FRA-HON').id, home: 3, away: 0)
  #Goal.create(score_id: 10, player_id: Player.find_by_name('O Giroud').id)
  #Goal.create(score_id: 10, player_id: Player.find_by_name('O Giroud').id)
  #Goal.create(score_id: 10, player_id: Player.find_by_name('K Benzema').id)
  #
  #Score.create(id: 11, fixture_id: Fixture.find_by_name('ARG-BOS').id, home: 3, away: 0)
  #Goal.create(score_id: 11, player_id: Player.find_by_name('A di Maria').id)
  #Goal.create(score_id: 11, player_id: Player.find_by_name('S Aguero').id)
  #Goal.create(score_id: 11, player_id: Player.find_by_name('L Messi').id)
  #
  #Score.create(id: 12, fixture_id: Fixture.find_by_name('IRA-NIG').id, home: 0, away: 0)
  #
  #Score.create(id: 13, fixture_id: Fixture.find_by_name('GER-POR').id, home: 2, away: 3)
  #Goal.create(score_id: 13, player_id: Player.find_by_name('L Podolski').id)
  #Goal.create(score_id: 13, player_id: Player.find_by_name('M Gotze').id)
  #Goal.create(score_id: 13, player_id: Player.find_by_name('C Ronaldo').id)
  #Goal.create(score_id: 13, player_id: Player.find_by_name('C Ronaldo').id)
  #Goal.create(score_id: 13, player_id: Player.find_by_name('C Ronaldo').id)
  #
  #Score.create(id: 14, fixture_id: Fixture.find_by_name('GHA-USA').id, home: 0, away: 0)
  #
  #Score.create(id: 15, fixture_id: Fixture.find_by_name('BEL-ALG').id, home: 3, away: 0)
  #Goal.create(score_id: 15, player_id: Player.find_by_name('R Lukaku').id)
  #Goal.create(score_id: 15, player_id: Player.find_by_name('R Lukaku').id)
  #Goal.create(score_id: 15, player_id: Player.find_by_name('E Hazard').id)
  #
  #Score.create(id: 16, fixture_id: Fixture.find_by_name('RUS-KOR').id, home: 0, away: 0)
  #
  #Score.create(id: 17, fixture_id: Fixture.find_by_name('BRA-MEX').id, home: 4, away: 0)
  #Goal.create(score_id: 17, player_id: Player.find_by_name('Neymar Jr').id)
  #Goal.create(score_id: 17, player_id: Player.find_by_name('Neymar Jr').id)
  #Goal.create(score_id: 17, player_id: Player.find_by_name('Neymar Jr').id)
  #Goal.create(score_id: 17, player_id: Player.find_by_name('Fred').id)
  #
  #Score.create(id: 18, fixture_id: Fixture.find_by_name('CAM-BRA').id, home: 1, away: 4)
  #Goal.create(score_id: 18, player_id: Player.find_by_name('Neymar Jr').id)
  #Goal.create(score_id: 18, player_id: Player.find_by_name('Neymar Jr').id)
  #Goal.create(score_id: 18, player_id: Player.find_by_name('Fred').id)
  #Goal.create(score_id: 18, player_id: Player.find_by_name('Fred').id)
  #Goal.create(score_id: 18, player_id: Player.find_by_name("S Eto'o").id)
