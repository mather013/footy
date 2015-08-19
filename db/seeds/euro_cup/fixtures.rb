#Fixture.delete_all

#Group stage round 1
Fixture.find_or_create_by_id(id: 1,  kickoff: DateTime.parse('2016-06-10 20:00:00'), name: 'A1-A2', home_team_id: 0, away_team_id: 0, week_id: 1)
Fixture.find_or_create_by_id(id: 2,  kickoff: DateTime.parse('2016-06-11 14:00:00'), name: 'A3-A4', home_team_id: 0, away_team_id: 0, week_id: 1)
Fixture.find_or_create_by_id(id: 3,  kickoff: DateTime.parse('2016-06-11 17:00:00'), name: 'B3-B4', home_team_id: 0, away_team_id: 0, week_id: 1)
Fixture.find_or_create_by_id(id: 4,  kickoff: DateTime.parse('2016-06-11 20:00:00'), name: 'B1-B2', home_team_id: 0, away_team_id: 0, week_id: 1)
Fixture.find_or_create_by_id(id: 5,  kickoff: DateTime.parse('2016-06-12 14:00:00'), name: 'D3-D4', home_team_id: 0, away_team_id: 0, week_id: 1)
Fixture.find_or_create_by_id(id: 6,  kickoff: DateTime.parse('2016-06-12 17:00:00'), name: 'C3-C4', home_team_id: 0, away_team_id: 0, week_id: 1)
Fixture.find_or_create_by_id(id: 7,  kickoff: DateTime.parse('2016-06-12 20:00:00'), name: 'C1-C2', home_team_id: 0, away_team_id: 0, week_id: 1)
Fixture.find_or_create_by_id(id: 8,  kickoff: DateTime.parse('2016-06-13 14:00:00'), name: 'D1-D2', home_team_id: 0, away_team_id: 0, week_id: 1)
Fixture.find_or_create_by_id(id: 9,  kickoff: DateTime.parse('2016-06-13 17:00:00'), name: 'E3-E4', home_team_id: 0, away_team_id: 0, week_id: 1)
Fixture.find_or_create_by_id(id: 10, kickoff: DateTime.parse('2016-06-13 20:00:00'), name: 'E1-E2', home_team_id: 0, away_team_id: 0, week_id: 1)
Fixture.find_or_create_by_id(id: 11, kickoff: DateTime.parse('2016-06-14 17:00:00'), name: 'F3-F4', home_team_id: 0, away_team_id: 0, week_id: 1)
Fixture.find_or_create_by_id(id: 12, kickoff: DateTime.parse('2016-06-14 20:00:00'), name: 'F1-F2', home_team_id: 0, away_team_id: 0, week_id: 1)

#Group stage round 2
Fixture.find_or_create_by_id(id: 13, kickoff: DateTime.parse('2016-06-10 20:00:00'), name: 'B2-B4', home_team_id: 0, away_team_id: 0, week_id: 1)
Fixture.find_or_create_by_id(id: 14, kickoff: DateTime.parse('2016-06-10 20:00:00'), name: 'A2-A4', home_team_id: 0, away_team_id: 0, week_id: 1)
Fixture.find_or_create_by_id(id: 15, kickoff: DateTime.parse('2016-06-10 20:00:00'), name: 'A1-A3', home_team_id: 0, away_team_id: 0, week_id: 1)
Fixture.find_or_create_by_id(id: 16, kickoff: DateTime.parse('2016-06-10 20:00:00'), name: 'B1-B3', home_team_id: 0, away_team_id: 0, week_id: 1)
Fixture.find_or_create_by_id(id: 17, kickoff: DateTime.parse('2016-06-15 14:00:00'), name: 'C2-C4', home_team_id: 0, away_team_id: 0, week_id: 2)
Fixture.find_or_create_by_id(id: 18, kickoff: DateTime.parse('2016-06-15 14:00:00'), name: 'C1-C3', home_team_id: 0, away_team_id: 0, week_id: 2)
Fixture.find_or_create_by_id(id: 19, kickoff: DateTime.parse('2016-06-15 14:00:00'), name: 'E2-E4', home_team_id: 0, away_team_id: 0, week_id: 2)
Fixture.find_or_create_by_id(id: 20, kickoff: DateTime.parse('2016-06-15 14:00:00'), name: 'D2-D4', home_team_id: 0, away_team_id: 0, week_id: 2)
Fixture.find_or_create_by_id(id: 21, kickoff: DateTime.parse('2016-06-15 14:00:00'), name: 'D1-D3', home_team_id: 0, away_team_id: 0, week_id: 2)
Fixture.find_or_create_by_id(id: 22, kickoff: DateTime.parse('2016-06-15 14:00:00'), name: 'E1-E3', home_team_id: 0, away_team_id: 0, week_id: 2)
Fixture.find_or_create_by_id(id: 23, kickoff: DateTime.parse('2016-06-15 14:00:00'), name: 'F2-F4', home_team_id: 0, away_team_id: 0, week_id: 2)
Fixture.find_or_create_by_id(id: 24, kickoff: DateTime.parse('2016-06-15 14:00:00'), name: 'F1-F3', home_team_id: 0, away_team_id: 0, week_id: 2)

#Group stage round 3
Fixture.find_or_create_by_id(id: 25, kickoff: DateTime.parse('2016-06-19 20:00:00'), name: 'A2-A3', home_team_id: 0, away_team_id: 0, week_id: 2)
Fixture.find_or_create_by_id(id: 26, kickoff: DateTime.parse('2016-06-19 20:00:00'), name: 'A4-A1', home_team_id: 0, away_team_id: 0, week_id: 2)
Fixture.find_or_create_by_id(id: 27, kickoff: DateTime.parse('2016-06-20 20:00:00'), name: 'B2-B3', home_team_id: 0, away_team_id: 0, week_id: 2)
Fixture.find_or_create_by_id(id: 28, kickoff: DateTime.parse('2016-06-20 20:00:00'), name: 'B4-B1', home_team_id: 0, away_team_id: 0, week_id: 2)
Fixture.find_or_create_by_id(id: 29, kickoff: DateTime.parse('2016-06-21 17:00:00'), name: 'C2-C3', home_team_id: 0, away_team_id: 0, week_id: 2)
Fixture.find_or_create_by_id(id: 30, kickoff: DateTime.parse('2016-06-21 17:00:00'), name: 'C4-C1', home_team_id: 0, away_team_id: 0, week_id: 2)
Fixture.find_or_create_by_id(id: 31, kickoff: DateTime.parse('2016-06-21 20:00:00'), name: 'D3-D2', home_team_id: 0, away_team_id: 0, week_id: 2)
Fixture.find_or_create_by_id(id: 32, kickoff: DateTime.parse('2016-06-21 20:00:00'), name: 'D4-D1', home_team_id: 0, away_team_id: 0, week_id: 2)
Fixture.find_or_create_by_id(id: 33, kickoff: DateTime.parse('2016-06-22 17:00:00'), name: 'F2-F3', home_team_id: 0, away_team_id: 0, week_id: 3)
Fixture.find_or_create_by_id(id: 34, kickoff: DateTime.parse('2016-06-22 17:00:00'), name: 'F4-F1', home_team_id: 0, away_team_id: 0, week_id: 3)
Fixture.find_or_create_by_id(id: 35, kickoff: DateTime.parse('2016-06-22 20:00:00'), name: 'E3-E2', home_team_id: 0, away_team_id: 0, week_id: 3)
Fixture.find_or_create_by_id(id: 36, kickoff: DateTime.parse('2016-06-22 20:00:00'), name: 'E4-E1', home_team_id: 0, away_team_id: 0, week_id: 3)

#Last 16 knockout
Fixture.find_or_create_by_id(id: 37, kickoff: DateTime.parse('2016-06-25 14:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 4)
Fixture.find_or_create_by_id(id: 38, kickoff: DateTime.parse('2016-06-25 17:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 4)
Fixture.find_or_create_by_id(id: 39, kickoff: DateTime.parse('2016-06-25 20:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 4)
Fixture.find_or_create_by_id(id: 40, kickoff: DateTime.parse('2016-06-26 14:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 4)
Fixture.find_or_create_by_id(id: 41, kickoff: DateTime.parse('2016-06-26 17:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 4)
Fixture.find_or_create_by_id(id: 42, kickoff: DateTime.parse('2016-06-26 20:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 4)
Fixture.find_or_create_by_id(id: 43, kickoff: DateTime.parse('2016-06-27 17:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 4)
Fixture.find_or_create_by_id(id: 44, kickoff: DateTime.parse('2016-06-27 20:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 4)

#Quarter final knockout
Fixture.find_or_create_by_id(id: 45, kickoff: DateTime.parse('2016-06-30 20:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 5)
Fixture.find_or_create_by_id(id: 46, kickoff: DateTime.parse('2016-07-01 20:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 5)
Fixture.find_or_create_by_id(id: 47, kickoff: DateTime.parse('2016-07-02 20:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 5)
Fixture.find_or_create_by_id(id: 48, kickoff: DateTime.parse('2016-07-03 20:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 5)

#Semi final knockout
Fixture.find_or_create_by_id(id: 49, kickoff: DateTime.parse('2016-07-06 20:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 6)
Fixture.find_or_create_by_id(id: 50, kickoff: DateTime.parse('2016-07-07 20:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 6)

#Final knockout
Fixture.find_or_create_by_id(id: 51, kickoff: DateTime.parse('2016-07-10 20:00:00'), name: 'TBA-TBA', home_team_id: 25, away_team_id: 25, week_id: 7)
