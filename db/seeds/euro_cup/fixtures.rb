Fixture.delete_all

#Group stage round 1
Fixture.find_or_create_by_id(id: 1,  kickoff: DateTime.parse('2021-06-10 19:00:00'), name: 'TUR-ITA', home_team_id: 22, away_team_id: 11, week_id: 1)
Fixture.find_or_create_by_id(id: 2,  kickoff: DateTime.parse('2021-06-11 13:00:00'), name: 'WAL-SWI', home_team_id: 24, away_team_id: 21, week_id: 1)
Fixture.find_or_create_by_id(id: 3,  kickoff: DateTime.parse('2021-06-11 16:00:00'), name: 'DEN-FIN', home_team_id: 5,  away_team_id: 7,  week_id: 1)
Fixture.find_or_create_by_id(id: 4,  kickoff: DateTime.parse('2021-06-11 19:00:00'), name: 'BEL-RUS', home_team_id: 2,  away_team_id: 16, week_id: 1)
Fixture.find_or_create_by_id(id: 5,  kickoff: DateTime.parse('2021-06-12 13:00:00'), name: 'NED-UKR', home_team_id: 12, away_team_id: 23, week_id: 1)
Fixture.find_or_create_by_id(id: 6,  kickoff: DateTime.parse('2021-06-12 16:00:00'), name: 'AUT-NMA', home_team_id: 1,  away_team_id: 13, week_id: 1)
Fixture.find_or_create_by_id(id: 7,  kickoff: DateTime.parse('2021-06-12 19:00:00'), name: 'ENG-CRO', home_team_id: 6,  away_team_id: 3,  week_id: 1)
Fixture.find_or_create_by_id(id: 8,  kickoff: DateTime.parse('2021-06-13 13:00:00'), name: 'SCO-CZE', home_team_id: 17, away_team_id: 4,  week_id: 1)
Fixture.find_or_create_by_id(id: 9,  kickoff: DateTime.parse('2021-06-13 16:00:00'), name: 'SPA-SWE', home_team_id: 19, away_team_id: 20, week_id: 1)
Fixture.find_or_create_by_id(id: 10, kickoff: DateTime.parse('2021-06-13 19:00:00'), name: 'POL-SVK', home_team_id: 14, away_team_id: 18, week_id: 1)
Fixture.find_or_create_by_id(id: 11, kickoff: DateTime.parse('2021-06-14 16:00:00'), name: 'HUN-POR', home_team_id: 10, away_team_id: 15, week_id: 1)
Fixture.find_or_create_by_id(id: 12, kickoff: DateTime.parse('2021-06-14 19:00:00'), name: 'FRA-GER', home_team_id: 8,  away_team_id: 9,  week_id: 1)

#Group stage round 2
Fixture.find_or_create_by_id(id: 13, kickoff: DateTime.parse('2021-06-15 13:00:00'), name: 'TUR-WAL', home_team_id: 22, away_team_id: 24, week_id: 2)
Fixture.find_or_create_by_id(id: 14, kickoff: DateTime.parse('2021-06-15 16:00:00'), name: 'ITA-SWI', home_team_id: 11, away_team_id: 21, week_id: 2)
Fixture.find_or_create_by_id(id: 15, kickoff: DateTime.parse('2021-06-15 19:00:00'), name: 'FIN-RUS', home_team_id: 7,  away_team_id: 16, week_id: 2)
Fixture.find_or_create_by_id(id: 16, kickoff: DateTime.parse('2021-06-16 13:00:00'), name: 'DEN-BEL', home_team_id: 5,  away_team_id: 2,  week_id: 2)
Fixture.find_or_create_by_id(id: 17, kickoff: DateTime.parse('2021-06-16 16:00:00'), name: 'NED-AUS', home_team_id: 12, away_team_id: 1,  week_id: 2)
Fixture.find_or_create_by_id(id: 18, kickoff: DateTime.parse('2021-06-16 19:00:00'), name: 'UKR-NMA', home_team_id: 23, away_team_id: 13, week_id: 2)
Fixture.find_or_create_by_id(id: 19, kickoff: DateTime.parse('2021-06-17 13:00:00'), name: 'CRO-CZE', home_team_id: 3,  away_team_id: 4,  week_id: 2)
Fixture.find_or_create_by_id(id: 20, kickoff: DateTime.parse('2021-06-17 16:00:00'), name: 'ENG-SCO', home_team_id: 6,  away_team_id: 17, week_id: 2)
Fixture.find_or_create_by_id(id: 21, kickoff: DateTime.parse('2021-06-17 19:00:00'), name: 'SWE-SVK', home_team_id: 20, away_team_id: 18, week_id: 2)
Fixture.find_or_create_by_id(id: 22, kickoff: DateTime.parse('2021-06-18 13:00:00'), name: 'SPA-POL', home_team_id: 19, away_team_id: 14, week_id: 2)
Fixture.find_or_create_by_id(id: 23, kickoff: DateTime.parse('2021-06-18 16:00:00'), name: 'HUN-FRA', home_team_id: 10, away_team_id: 8,  week_id: 2)
Fixture.find_or_create_by_id(id: 24, kickoff: DateTime.parse('2021-06-18 19:00:00'), name: 'POR-GER', home_team_id: 15, away_team_id: 9,  week_id: 2)

#Group stage round 3
Fixture.find_or_create_by_id(id: 25, kickoff: DateTime.parse('2021-06-19 19:00:00'), name: 'SWI-TUR', home_team_id: 21, away_team_id: 22, week_id: 3)
Fixture.find_or_create_by_id(id: 26, kickoff: DateTime.parse('2021-06-19 19:00:00'), name: 'ITA-WAL', home_team_id: 11, away_team_id: 24, week_id: 3)
Fixture.find_or_create_by_id(id: 27, kickoff: DateTime.parse('2021-06-20 19:00:00'), name: 'RUS-DEN', home_team_id: 16, away_team_id: 5,  week_id: 3)
Fixture.find_or_create_by_id(id: 28, kickoff: DateTime.parse('2021-06-20 19:00:00'), name: 'FIN-BEL', home_team_id: 7,  away_team_id: 2,  week_id: 3)
Fixture.find_or_create_by_id(id: 29, kickoff: DateTime.parse('2021-06-21 16:00:00'), name: 'NMA-NED', home_team_id: 13, away_team_id: 12, week_id: 3)
Fixture.find_or_create_by_id(id: 30, kickoff: DateTime.parse('2021-06-21 16:00:00'), name: 'UKR-AUT', home_team_id: 23, away_team_id: 1,  week_id: 3)
Fixture.find_or_create_by_id(id: 31, kickoff: DateTime.parse('2021-06-21 19:00:00'), name: 'CRO-SCO', home_team_id: 3,  away_team_id: 17, week_id: 3)
Fixture.find_or_create_by_id(id: 32, kickoff: DateTime.parse('2021-06-21 19:00:00'), name: 'CZE-ENG', home_team_id: 4,  away_team_id: 6,  week_id: 3)
Fixture.find_or_create_by_id(id: 33, kickoff: DateTime.parse('2021-06-22 16:00:00'), name: 'SVK-SPA', home_team_id: 18, away_team_id: 19, week_id: 3)
Fixture.find_or_create_by_id(id: 34, kickoff: DateTime.parse('2021-06-22 16:00:00'), name: 'SWE-POL', home_team_id: 20, away_team_id: 14, week_id: 3)
Fixture.find_or_create_by_id(id: 35, kickoff: DateTime.parse('2021-06-22 19:00:00'), name: 'POR-FRA', home_team_id: 15, away_team_id: 8,  week_id: 3)
Fixture.find_or_create_by_id(id: 36, kickoff: DateTime.parse('2021-06-22 19:00:00'), name: 'GER-HUN', home_team_id: 9,  away_team_id: 10, week_id: 3)

#Last 16 knockout
Fixture.find_or_create_by_id(id: 37, kickoff: DateTime.parse('2021-06-25 13:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 4)
Fixture.find_or_create_by_id(id: 38, kickoff: DateTime.parse('2021-06-25 16:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 4)
Fixture.find_or_create_by_id(id: 39, kickoff: DateTime.parse('2021-06-25 19:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 4)
Fixture.find_or_create_by_id(id: 40, kickoff: DateTime.parse('2021-06-26 13:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 4)
Fixture.find_or_create_by_id(id: 41, kickoff: DateTime.parse('2021-06-26 16:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 4)
Fixture.find_or_create_by_id(id: 42, kickoff: DateTime.parse('2021-06-26 19:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 4)
Fixture.find_or_create_by_id(id: 43, kickoff: DateTime.parse('2021-06-27 16:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 4)
Fixture.find_or_create_by_id(id: 44, kickoff: DateTime.parse('2021-06-27 19:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 4)

#Quarter final knockout
Fixture.find_or_create_by_id(id: 45, kickoff: DateTime.parse('2021-06-30 19:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 5)
Fixture.find_or_create_by_id(id: 46, kickoff: DateTime.parse('2021-07-01 19:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 5)
Fixture.find_or_create_by_id(id: 47, kickoff: DateTime.parse('2021-07-02 19:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 5)
Fixture.find_or_create_by_id(id: 48, kickoff: DateTime.parse('2021-07-03 19:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 5)

#Semi final knockout
Fixture.find_or_create_by_id(id: 49, kickoff: DateTime.parse('2021-07-06 19:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 6)
Fixture.find_or_create_by_id(id: 50, kickoff: DateTime.parse('2021-07-07 19:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 6)

#Final knockout
Fixture.find_or_create_by_id(id: 51, kickoff: DateTime.parse('2021-07-11 19:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 7)
