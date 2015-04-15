#Fixture.delete_all

#Group stage round 1
Fixture.find_or_create_by_id(id: 1,  kickoff: DateTime.parse('2015-06-12 00:30:00'), name: 'CHI-ECU', home_team_id: 4,  away_team_id: 6,  week_id: 1)
Fixture.find_or_create_by_id(id: 2,  kickoff: DateTime.parse('2015-06-13 00:30:00'), name: 'MEX-BOL', home_team_id: 8,  away_team_id: 2,  week_id: 1)
Fixture.find_or_create_by_id(id: 3,  kickoff: DateTime.parse('2015-06-13 20:00:00'), name: 'URU-JAM', home_team_id: 11, away_team_id: 7,  week_id: 1)
Fixture.find_or_create_by_id(id: 4,  kickoff: DateTime.parse('2015-06-13 22:30:00'), name: 'ARG-PAR', home_team_id: 1,  away_team_id: 9,  week_id: 1)
Fixture.find_or_create_by_id(id: 5,  kickoff: DateTime.parse('2015-06-14 20:00:00'), name: 'COL-VEN', home_team_id: 5,  away_team_id: 12, week_id: 1)
Fixture.find_or_create_by_id(id: 6,  kickoff: DateTime.parse('2015-06-14 22:30:00'), name: 'BRA-PER', home_team_id: 3,  away_team_id: 10, week_id: 1)

#Group stage round 2
Fixture.find_or_create_by_id(id: 7,  kickoff: DateTime.parse('2015-06-15 22:00:00'), name: 'ECU-BOL', home_team_id: 6,  away_team_id: 2,  week_id: 2)
Fixture.find_or_create_by_id(id: 8,  kickoff: DateTime.parse('2015-06-16 00:30:00'), name: 'CHI-MEX', home_team_id: 4,  away_team_id: 8,  week_id: 2)
Fixture.find_or_create_by_id(id: 9,  kickoff: DateTime.parse('2015-06-16 22:00:00'), name: 'PAR-JAM', home_team_id: 9,  away_team_id: 7,  week_id: 2)
Fixture.find_or_create_by_id(id: 10, kickoff: DateTime.parse('2015-06-17 00:30:00'), name: 'ARG-URU', home_team_id: 1,  away_team_id: 11, week_id: 2)
Fixture.find_or_create_by_id(id: 11, kickoff: DateTime.parse('2015-06-18 00:30:00'), name: 'BRA-COL', home_team_id: 3,  away_team_id: 5,  week_id: 2)
Fixture.find_or_create_by_id(id: 12, kickoff: DateTime.parse('2015-06-19 00:30:00'), name: 'PER-VEN', home_team_id: 10, away_team_id: 12, week_id: 2)

#Group stage round 3
Fixture.find_or_create_by_id(id: 13, kickoff: DateTime.parse('2015-06-19 22:00:00'), name: 'MEX-ECU', home_team_id: 8,  away_team_id: 6,  week_id: 3)
Fixture.find_or_create_by_id(id: 14, kickoff: DateTime.parse('2015-06-20 00:30:00'), name: 'CHI-BOL', home_team_id: 4,  away_team_id: 2,  week_id: 3)
Fixture.find_or_create_by_id(id: 15, kickoff: DateTime.parse('2015-06-20 20:00:00'), name: 'URU-PAR', home_team_id: 11, away_team_id: 9,  week_id: 3)
Fixture.find_or_create_by_id(id: 16, kickoff: DateTime.parse('2015-06-20 22:30:00'), name: 'ARG-JAM', home_team_id: 1,  away_team_id: 7,  week_id: 3)
Fixture.find_or_create_by_id(id: 17, kickoff: DateTime.parse('2015-06-21 20:00:00'), name: 'COL-PER', home_team_id: 5,  away_team_id: 10, week_id: 3)
Fixture.find_or_create_by_id(id: 18, kickoff: DateTime.parse('2015-06-21 22:30:00'), name: 'BRA-VEN', home_team_id: 3,  away_team_id: 12, week_id: 3)

#Quarter final knockout
Fixture.find_or_create_by_id(id: 19, kickoff: DateTime.parse('2015-06-25 00:30:00'), name: 'E2-E4', home_team_id: 13, away_team_id: 13, week_id: 4)
Fixture.find_or_create_by_id(id: 20, kickoff: DateTime.parse('2015-06-26 00:30:00'), name: 'D2-D4', home_team_id: 13, away_team_id: 13, week_id: 4)
Fixture.find_or_create_by_id(id: 21, kickoff: DateTime.parse('2015-06-27 00:30:00'), name: 'D1-D3', home_team_id: 13, away_team_id: 13, week_id: 4)
Fixture.find_or_create_by_id(id: 22, kickoff: DateTime.parse('2015-06-28 00:30:00'), name: 'E1-E3', home_team_id: 13, away_team_id: 13, week_id: 4)

#Semi final knockout
Fixture.find_or_create_by_id(id: 23, kickoff: DateTime.parse('2015-06-30 00:30:00'), name: 'TBA-TBA', home_team_id: 13, away_team_id: 13, week_id: 5)
Fixture.find_or_create_by_id(id: 24, kickoff: DateTime.parse('2015-07-01 00:30:00'), name: 'TBA-TBA', home_team_id: 13, away_team_id: 13, week_id: 5)

#Final knockout
Fixture.find_or_create_by_id(id: 25, kickoff: DateTime.parse('2015-07-04 00:30:00'), name: 'TBA-TBA', home_team_id: 13, away_team_id: 13, week_id: 6)
Fixture.find_or_create_by_id(id: 26, kickoff: DateTime.parse('2015-07-04 21:00:00'), name: 'TBA-TBA', home_team_id: 13, away_team_id: 13, week_id: 6)
