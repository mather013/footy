Fixture.delete_all

#Group stage round 1
Fixture.find_or_create_by_id(:id => 1,  :kickoff => DateTime.parse('2014-06-12 17:00:00'), :name => 'BRA-CRO', :home_team_id => 6,  :away_team_id => 12, :week_id => 1)
Fixture.find_or_create_by_id(:id => 2,  :kickoff => DateTime.parse('2014-06-13 13:00:00'), :name => 'MEX-CAM', :home_team_id => 24, :away_team_id => 7,  :week_id => 1)
Fixture.find_or_create_by_id(:id => 3,  :kickoff => DateTime.parse('2014-06-13 16:00:00'), :name => 'SPA-NET', :home_team_id => 29, :away_team_id => 25, :week_id => 1)
Fixture.find_or_create_by_id(:id => 4,  :kickoff => DateTime.parse('2014-06-13 18:00:00'), :name => 'CHI-AUS', :home_team_id => 8,  :away_team_id => 3,  :week_id => 1)
Fixture.find_or_create_by_id(:id => 5,  :kickoff => DateTime.parse('2014-06-14 13:00:00'), :name => 'COL-GRE', :home_team_id => 9,  :away_team_id => 18, :week_id => 1)
Fixture.find_or_create_by_id(:id => 6,  :kickoff => DateTime.parse('2014-06-14 22:00:00'), :name => 'COT-JAP', :home_team_id => 10, :away_team_id => 22, :week_id => 1)
Fixture.find_or_create_by_id(:id => 7,  :kickoff => DateTime.parse('2014-06-14 16:00:00'), :name => 'URA-COS', :home_team_id => 31, :away_team_id => 11, :week_id => 1)
Fixture.find_or_create_by_id(:id => 8,  :kickoff => DateTime.parse('2014-06-14 18:00:00'), :name => 'ENG-ITA', :home_team_id => 14, :away_team_id => 21, :week_id => 1)
Fixture.find_or_create_by_id(:id => 9,  :kickoff => DateTime.parse('2014-06-15 13:00:00'), :name => 'SWI-ECU', :home_team_id => 30, :away_team_id => 13, :week_id => 1)
Fixture.find_or_create_by_id(:id => 10, :kickoff => DateTime.parse('2014-06-15 16:00:00'), :name => 'FRA-HON', :home_team_id => 15, :away_team_id => 19, :week_id => 1)
Fixture.find_or_create_by_id(:id => 11, :kickoff => DateTime.parse('2014-06-15 19:00:00'), :name => 'ARG-BOS', :home_team_id => 2,  :away_team_id =>  5, :week_id => 1)
Fixture.find_or_create_by_id(:id => 12, :kickoff => DateTime.parse('2014-06-16 16:00:00'), :name => 'IRA-NIG', :home_team_id => 20, :away_team_id => 26, :week_id => 1)
Fixture.find_or_create_by_id(:id => 13, :kickoff => DateTime.parse('2014-06-16 13:00:00'), :name => 'GER-POR', :home_team_id => 16, :away_team_id => 27, :week_id => 1)
Fixture.find_or_create_by_id(:id => 14, :kickoff => DateTime.parse('2014-06-16 19:00:00'), :name => 'GHA-USA', :home_team_id => 17, :away_team_id => 32, :week_id => 1)
Fixture.find_or_create_by_id(:id => 15, :kickoff => DateTime.parse('2014-06-17 13:00:00'), :name => 'BEL-ALG', :home_team_id => 4,  :away_team_id => 1,  :week_id => 1)
Fixture.find_or_create_by_id(:id => 16, :kickoff => DateTime.parse('2014-06-17 18:00:00'), :name => 'RUS-KOR', :home_team_id => 28, :away_team_id => 23, :week_id => 1)

#Group stage round 2
Fixture.find_or_create_by_id(:id => 17, :kickoff => DateTime.parse('2014-06-17 16:00:00'), :name => 'BRA-MEX', :home_team_id => 6,  :away_team_id => 24, :week_id => 2)
Fixture.find_or_create_by_id(:id => 18, :kickoff => DateTime.parse('2014-06-18 18:00:00'), :name => 'CAM-CRO', :home_team_id => 7,  :away_team_id => 12, :week_id => 2)
Fixture.find_or_create_by_id(:id => 19, :kickoff => DateTime.parse('2014-06-18 16:00:00'), :name => 'SPA-CHI', :home_team_id => 7,  :away_team_id => 12, :week_id => 2)
Fixture.find_or_create_by_id(:id => 20, :kickoff => DateTime.parse('2014-06-18 13:00:00'), :name => 'AUS-NET', :home_team_id => 7,  :away_team_id => 12, :week_id => 2)
Fixture.find_or_create_by_id(:id => 21, :kickoff => DateTime.parse('2014-06-19 13:00:00'), :name => 'COL-COT', :home_team_id => 7,  :away_team_id => 12, :week_id => 2)
Fixture.find_or_create_by_id(:id => 22, :kickoff => DateTime.parse('2014-06-19 19:00:00'), :name => 'JAP-GRE', :home_team_id => 7,  :away_team_id => 12, :week_id => 2)
Fixture.find_or_create_by_id(:id => 23, :kickoff => DateTime.parse('2014-06-19 16:00:00'), :name => 'UGU-ENG', :home_team_id => 7,  :away_team_id => 12, :week_id => 2)
Fixture.find_or_create_by_id(:id => 24, :kickoff => DateTime.parse('2014-06-20 13:00:00'), :name => 'ITA-COS', :home_team_id => 7,  :away_team_id => 12, :week_id => 2)
Fixture.find_or_create_by_id(:id => 25, :kickoff => DateTime.parse('2014-06-20 16:00:00'), :name => 'SWI-FRA', :home_team_id => 7,  :away_team_id => 12, :week_id => 2)
Fixture.find_or_create_by_id(:id => 26, :kickoff => DateTime.parse('2014-06-20 19:00:00'), :name => 'HON-ECU', :home_team_id => 7,  :away_team_id => 12, :week_id => 2)
Fixture.find_or_create_by_id(:id => 27, :kickoff => DateTime.parse('2014-06-21 13:00:00'), :name => 'ARG-IRA', :home_team_id => 7,  :away_team_id => 12, :week_id => 2)
Fixture.find_or_create_by_id(:id => 28, :kickoff => DateTime.parse('2014-06-21 18:00:00'), :name => 'NIG-BOS', :home_team_id => 7,  :away_team_id => 12, :week_id => 2)
Fixture.find_or_create_by_id(:id => 29, :kickoff => DateTime.parse('2014-06-21 16:00:00'), :name => 'GER-GHA', :home_team_id => 7,  :away_team_id => 12, :week_id => 2)
Fixture.find_or_create_by_id(:id => 30, :kickoff => DateTime.parse('2014-06-22 18:00:00'), :name => 'USA-POR', :home_team_id => 7,  :away_team_id => 12, :week_id => 2)
Fixture.find_or_create_by_id(:id => 31, :kickoff => DateTime.parse('2014-06-22 13:00:00'), :name => 'BEL-RUS', :home_team_id => 7,  :away_team_id => 12, :week_id => 2)
Fixture.find_or_create_by_id(:id => 32, :kickoff => DateTime.parse('2014-06-22 16:00:00'), :name => 'KOR-ALG', :home_team_id => 7,  :away_team_id => 12, :week_id => 2)

#Group stage round 3
Fixture.find_or_create_by_id(:id => 33, :kickoff => DateTime.parse('2014-06-23 17:00:00'), :name => 'CAM-BRA', :home_team_id => 7,  :away_team_id => 6,  :week_id => 3)
#TODO: finish group stage round 3

#Last 16 knockout
Fixture.find_or_create_by_id(:id => 49, :kickoff => DateTime.parse('2014-06-28 13:00:00'), :name => 'TBA-TBA', :home_team_id => 33, :away_team_id => 33, :week_id => 4)
Fixture.find_or_create_by_id(:id => 50, :kickoff => DateTime.parse('2014-06-28 17:00:00'), :name => 'TBA-TBA', :home_team_id => 33, :away_team_id => 33, :week_id => 4)
Fixture.find_or_create_by_id(:id => 51, :kickoff => DateTime.parse('2014-06-29 13:00:00'), :name => 'TBA-TBA', :home_team_id => 33, :away_team_id => 33, :week_id => 4)
Fixture.find_or_create_by_id(:id => 52, :kickoff => DateTime.parse('2014-06-29 17:00:00'), :name => 'TBA-TBA', :home_team_id => 33, :away_team_id => 33, :week_id => 4)
Fixture.find_or_create_by_id(:id => 53, :kickoff => DateTime.parse('2014-06-30 13:00:00'), :name => 'TBA-TBA', :home_team_id => 33, :away_team_id => 33, :week_id => 4)
Fixture.find_or_create_by_id(:id => 54, :kickoff => DateTime.parse('2014-06-30 17:00:00'), :name => 'TBA-TBA', :home_team_id => 33, :away_team_id => 33, :week_id => 4)
Fixture.find_or_create_by_id(:id => 55, :kickoff => DateTime.parse('2014-07-01 13:00:00'), :name => 'TBA-TBA', :home_team_id => 33, :away_team_id => 33, :week_id => 4)
Fixture.find_or_create_by_id(:id => 56, :kickoff => DateTime.parse('2014-07-01 17:00:00'), :name => 'TBA-TBA', :home_team_id => 33, :away_team_id => 33, :week_id => 4)

#Quarted final knockout
Fixture.find_or_create_by_id(:id => 57, :kickoff => DateTime.parse('2014-07-04 17:00:00'), :name => 'TBA-TBA', :home_team_id => 33, :away_team_id => 33, :week_id => 5)
Fixture.find_or_create_by_id(:id => 58, :kickoff => DateTime.parse('2014-07-04 13:00:00'), :name => 'TBA-TBA', :home_team_id => 33, :away_team_id => 33, :week_id => 5)
Fixture.find_or_create_by_id(:id => 59, :kickoff => DateTime.parse('2014-07-05 17:00:00'), :name => 'TBA-TBA', :home_team_id => 33, :away_team_id => 33, :week_id => 5)
Fixture.find_or_create_by_id(:id => 60, :kickoff => DateTime.parse('2014-07-05 13:00:00'), :name => 'TBA-TBA', :home_team_id => 33, :away_team_id => 33, :week_id => 5)

#Semi final knockout
Fixture.find_or_create_by_id(:id => 61, :kickoff => DateTime.parse('2014-07-08 17:00:00'), :name => 'TBA-TBA', :home_team_id => 33, :away_team_id => 33, :week_id => 6)
Fixture.find_or_create_by_id(:id => 62, :kickoff => DateTime.parse('2014-07-09 17:00:00'), :name => 'TBA-TBA', :home_team_id => 33, :away_team_id => 33, :week_id => 6)

#Final knockout
Fixture.find_or_create_by_id(:id => 63, :kickoff => DateTime.parse('2014-07-12 17:00:00'), :name => 'TBA-TBA', :home_team_id => 33, :away_team_id => 33, :week_id => 7)
Fixture.find_or_create_by_id(:id => 64, :kickoff => DateTime.parse('2014-07-13 16:00:00'), :name => 'TBA-TBA', :home_team_id => 33, :away_team_id => 33, :week_id => 7)
