Fixture.delete_all

#Group stage round 1
Fixture.create(id: 1,  kickoff: DateTime.parse('2018-06-14 15:00:00'), name: 'RUS-SAU', home_team_id: 24, away_team_id: 25, status: 'scheduled', week_id: 1)
Fixture.create(id: 2,  kickoff: DateTime.parse('2018-06-15 12:00:00'), name: 'EGY-URU', home_team_id: 9,  away_team_id: 32, status: 'scheduled', week_id: 1)
Fixture.create(id: 3,  kickoff: DateTime.parse('2018-06-15 15:00:00'), name: 'MOR-IRA', home_team_id: 18, away_team_id: 14, status: 'scheduled', week_id: 1)
Fixture.create(id: 4,  kickoff: DateTime.parse('2018-06-15 18:00:00'), name: 'POR-SPA', home_team_id: 23, away_team_id: 28, status: 'scheduled', week_id: 1)
Fixture.create(id: 5,  kickoff: DateTime.parse('2018-06-16 10:00:00'), name: 'FRA-AUS', home_team_id: 11, away_team_id: 2,  status: 'scheduled', week_id: 1)
Fixture.create(id: 6,  kickoff: DateTime.parse('2018-06-16 13:00:00'), name: 'ARG-ICE', home_team_id: 1,  away_team_id: 13, status: 'scheduled', week_id: 1)
Fixture.create(id: 7,  kickoff: DateTime.parse('2018-06-16 16:00:00'), name: 'PER-DEN', home_team_id: 21, away_team_id: 8,  status: 'scheduled', week_id: 1)
Fixture.create(id: 8,  kickoff: DateTime.parse('2018-06-16 19:00:00'), name: 'CRO-NIG', home_team_id: 7,  away_team_id: 19, status: 'scheduled', week_id: 1)
Fixture.create(id: 9,  kickoff: DateTime.parse('2018-06-17 12:00:00'), name: 'COS-SER', home_team_id: 6,  away_team_id: 27, status: 'scheduled', week_id: 1)
Fixture.create(id: 10, kickoff: DateTime.parse('2018-06-17 15:00:00'), name: 'GER-MEX', home_team_id: 12, away_team_id: 17, status: 'scheduled', week_id: 1)
Fixture.create(id: 11, kickoff: DateTime.parse('2018-06-17 18:00:00'), name: 'BRA-SWI', home_team_id: 4,  away_team_id: 30, status: 'scheduled', week_id: 1)
Fixture.create(id: 12, kickoff: DateTime.parse('2018-06-18 12:00:00'), name: 'SWE-KOR', home_team_id: 29, away_team_id: 16, status: 'scheduled', week_id: 1)
Fixture.create(id: 13, kickoff: DateTime.parse('2018-06-18 15:00:00'), name: 'BEL-PAN', home_team_id: 3,  away_team_id: 20, status: 'scheduled', week_id: 1)
Fixture.create(id: 14, kickoff: DateTime.parse('2018-06-18 18:00:00'), name: 'TUN-ENG', home_team_id: 31, away_team_id: 10, status: 'scheduled', week_id: 1)
Fixture.create(id: 15, kickoff: DateTime.parse('2018-06-19 12:00:00'), name: 'COL-JAP', home_team_id: 5,  away_team_id: 15, status: 'scheduled', week_id: 1)
Fixture.create(id: 16, kickoff: DateTime.parse('2018-06-19 15:00:00'), name: 'POL-SEN', home_team_id: 22, away_team_id: 26, status: 'scheduled', week_id: 1)

#Group stage round
Fixture.create(id: 17, kickoff: DateTime.parse('2018-06-19 18:00:00'), name: 'RUS-EGY', home_team_id: 24, away_team_id: 9,  status: 'scheduled', week_id: 2)
Fixture.create(id: 18, kickoff: DateTime.parse('2018-06-20 12:00:00'), name: 'POR-MOR', home_team_id: 23, away_team_id: 18, status: 'scheduled', week_id: 2)
Fixture.create(id: 19, kickoff: DateTime.parse('2018-06-20 15:00:00'), name: 'URU-SAU', home_team_id: 32, away_team_id: 25, status: 'scheduled', week_id: 2)
Fixture.create(id: 20, kickoff: DateTime.parse('2018-06-20 18:00:00'), name: 'IRA-SPA', home_team_id: 14, away_team_id: 28, status: 'scheduled', week_id: 2)
Fixture.create(id: 21, kickoff: DateTime.parse('2018-06-21 12:00:00'), name: 'DEN-AUS', home_team_id: 8,  away_team_id: 2,  status: 'scheduled', week_id: 2)
Fixture.create(id: 22, kickoff: DateTime.parse('2018-06-21 15:00:00'), name: 'FRA-PER', home_team_id: 11, away_team_id: 21, status: 'scheduled', week_id: 2)
Fixture.create(id: 23, kickoff: DateTime.parse('2018-06-21 18:00:00'), name: 'ARG-CRO', home_team_id: 1,  away_team_id: 7,  status: 'scheduled', week_id: 2)
Fixture.create(id: 24, kickoff: DateTime.parse('2018-06-22 12:00:00'), name: 'BRA-COS', home_team_id: 4,  away_team_id: 6,  status: 'scheduled', week_id: 2)
Fixture.create(id: 25, kickoff: DateTime.parse('2018-06-22 15:00:00'), name: 'NIG-ICE', home_team_id: 19, away_team_id: 13, status: 'scheduled', week_id: 2)
Fixture.create(id: 26, kickoff: DateTime.parse('2018-06-22 18:00:00'), name: 'SER-SWI', home_team_id: 27, away_team_id: 30, status: 'scheduled', week_id: 2)
Fixture.create(id: 27, kickoff: DateTime.parse('2018-06-23 12:00:00'), name: 'BEL-TUN', home_team_id: 3,  away_team_id: 31, status: 'scheduled', week_id: 2)
Fixture.create(id: 28, kickoff: DateTime.parse('2018-06-23 15:00:00'), name: 'KOR-MEX', home_team_id: 16, away_team_id: 17, status: 'scheduled', week_id: 2)
Fixture.create(id: 29, kickoff: DateTime.parse('2018-06-23 18:00:00'), name: 'GER-SWE', home_team_id: 12, away_team_id: 29, status: 'scheduled', week_id: 2)
Fixture.create(id: 30, kickoff: DateTime.parse('2018-06-24 12:00:00'), name: 'ENG-PAN', home_team_id: 10, away_team_id: 20, status: 'scheduled', week_id: 2)
Fixture.create(id: 31, kickoff: DateTime.parse('2018-06-24 15:00:00'), name: 'JAP-SEN', home_team_id: 15, away_team_id: 26, status: 'scheduled', week_id: 2)
Fixture.create(id: 32, kickoff: DateTime.parse('2018-06-24 18:00:00'), name: 'POL-COL', home_team_id: 22, away_team_id: 5,  status: 'scheduled', week_id: 2)

#Group stage round 3
Fixture.create(id: 33, kickoff: DateTime.parse('2018-06-25 14:00:00'), name: 'URU-RUS', home_team_id: 32, away_team_id: 24, status: 'scheduled', week_id: 3)
Fixture.create(id: 34, kickoff: DateTime.parse('2018-06-25 14:00:00'), name: 'SAU-EGY', home_team_id: 25, away_team_id: 9,  status: 'scheduled', week_id: 3)
Fixture.create(id: 35, kickoff: DateTime.parse('2018-06-25 18:00:00'), name: 'SPA-MOR', home_team_id: 28, away_team_id: 18, status: 'scheduled', week_id: 3)
Fixture.create(id: 36, kickoff: DateTime.parse('2018-06-25 18:00:00'), name: 'IRA-POR', home_team_id: 14, away_team_id: 23, status: 'scheduled', week_id: 3)
Fixture.create(id: 37, kickoff: DateTime.parse('2018-06-26 14:00:00'), name: 'DEN-FRA', home_team_id: 8,  away_team_id: 11, status: 'scheduled', week_id: 3)
Fixture.create(id: 38, kickoff: DateTime.parse('2018-06-26 14:00:00'), name: 'AUS-PER', home_team_id: 2,  away_team_id: 21, status: 'scheduled', week_id: 3)
Fixture.create(id: 39, kickoff: DateTime.parse('2018-06-26 18:00:00'), name: 'ICE-CRO', home_team_id: 13, away_team_id: 7,  status: 'scheduled', week_id: 3)
Fixture.create(id: 40, kickoff: DateTime.parse('2018-06-26 18:00:00'), name: 'NIG-ARG', home_team_id: 19, away_team_id: 1,  status: 'scheduled', week_id: 3)
Fixture.create(id: 41, kickoff: DateTime.parse('2018-06-27 14:00:00'), name: 'MEX-SWE', home_team_id: 17, away_team_id: 29, status: 'scheduled', week_id: 3)
Fixture.create(id: 42, kickoff: DateTime.parse('2018-06-27 14:00:00'), name: 'KOR-GER', home_team_id: 16, away_team_id: 12, status: 'scheduled', week_id: 3)
Fixture.create(id: 43, kickoff: DateTime.parse('2018-06-27 18:00:00'), name: 'SER-BRA', home_team_id: 27, away_team_id: 4,  status: 'scheduled', week_id: 3)
Fixture.create(id: 44, kickoff: DateTime.parse('2018-06-27 18:00:00'), name: 'SWI-COS', home_team_id: 30, away_team_id: 6,  status: 'scheduled', week_id: 3)
Fixture.create(id: 45, kickoff: DateTime.parse('2018-06-28 14:00:00'), name: 'JAP-POL', home_team_id: 15, away_team_id: 22, status: 'scheduled', week_id: 3)
Fixture.create(id: 46, kickoff: DateTime.parse('2018-06-28 14:00:00'), name: 'SEN-COL', home_team_id: 26, away_team_id: 5,  status: 'scheduled', week_id: 3)
Fixture.create(id: 47, kickoff: DateTime.parse('2018-06-28 18:00:00'), name: 'PAN-TUN', home_team_id: 20, away_team_id: 31, status: 'scheduled', week_id: 3)
Fixture.create(id: 48, kickoff: DateTime.parse('2018-06-28 18:00:00'), name: 'ENG-BEL', home_team_id: 10, away_team_id: 3,  status: 'scheduled', week_id: 3)

#Last 16 knockout
Fixture.create(id: 49, kickoff: DateTime.parse('2018-06-30 14:00:00'), name: 'TBA-TBA', home_team_id: 33, away_team_id: 33, status: 'scheduled', week_id: 4)
Fixture.create(id: 50, kickoff: DateTime.parse('2018-06-30 18:00:00'), name: 'TBA-TBA', home_team_id: 33, away_team_id: 33, status: 'scheduled', week_id: 4)
Fixture.create(id: 51, kickoff: DateTime.parse('2018-07-01 14:00:00'), name: 'TBA-TBA', home_team_id: 33, away_team_id: 33, status: 'scheduled', week_id: 4)
Fixture.create(id: 52, kickoff: DateTime.parse('2018-07-01 18:00:00'), name: 'TBA-TBA', home_team_id: 33, away_team_id: 33, status: 'scheduled', week_id: 4)
Fixture.create(id: 53, kickoff: DateTime.parse('2018-07-02 14:00:00'), name: 'TBA-TBA', home_team_id: 33, away_team_id: 33, status: 'scheduled', week_id: 4)
Fixture.create(id: 54, kickoff: DateTime.parse('2018-07-02 18:00:00'), name: 'TBA-TBA', home_team_id: 33, away_team_id: 33, status: 'scheduled', week_id: 4)
Fixture.create(id: 55, kickoff: DateTime.parse('2018-07-03 14:00:00'), name: 'TBA-TBA', home_team_id: 33, away_team_id: 33, status: 'scheduled', week_id: 4)
Fixture.create(id: 56, kickoff: DateTime.parse('2018-07-03 18:00:00'), name: 'TBA-TBA', home_team_id: 33, away_team_id: 33, status: 'scheduled', week_id: 4)

#Quarter final knockout
Fixture.create(id: 57, kickoff: DateTime.parse('2018-07-06 14:00:00'), name: 'TBA-TBA', home_team_id: 33, away_team_id: 33, status: 'scheduled', week_id: 5)
Fixture.create(id: 58, kickoff: DateTime.parse('2018-07-06 18:00:00'), name: 'TBA-TBA', home_team_id: 33, away_team_id: 33, status: 'scheduled', week_id: 5)
Fixture.create(id: 59, kickoff: DateTime.parse('2018-07-07 14:00:00'), name: 'TBA-TBA', home_team_id: 33, away_team_id: 33, status: 'scheduled', week_id: 5)
Fixture.create(id: 60, kickoff: DateTime.parse('2018-07-07 18:00:00'), name: 'TBA-TBA', home_team_id: 33, away_team_id: 33, status: 'scheduled', week_id: 5)

#Semi final knockout
Fixture.create(id: 61, kickoff: DateTime.parse('2018-07-10 18:00:00'), name: 'TBA-TBA', home_team_id: 33, away_team_id: 33, status: 'scheduled', week_id: 6)
Fixture.create(id: 62, kickoff: DateTime.parse('2018-07-11 18:00:00'), name: 'TBA-TBA', home_team_id: 33, away_team_id: 33, status: 'scheduled', week_id: 6)

#Final knockout
Fixture.create(id: 63, kickoff: DateTime.parse('2018-07-14 14:00:00'), name: 'TBA-TBA', home_team_id: 33, away_team_id: 33, status: 'scheduled', week_id: 7)
Fixture.create(id: 64, kickoff: DateTime.parse('2018-07-15 15:00:00'), name: 'TBA-TBA', home_team_id: 33, away_team_id: 33, status: 'scheduled', week_id: 7)
