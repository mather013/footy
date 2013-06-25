User.delete_all
Competition.delete_all
Fixture.delete_all
Team.delete_all

User.find_or_create_by_username(:id => 1, :username => 'markm', :password => 'bodie')
User.find_or_create_by_username(:id => 2, :username => 'davidb', :password => 'apple12')

Competition.find_or_create_by_id(:id => 1,
                                 :week => '201301',
                                 :description => 'Premier League 17th Aug',
                                 :close_date => DateTime.parse('17-08-2013'))

Competition.find_or_create_by_id(:id => 2,
                                 :week => '201302',
                                 :description => 'Premier League 24th Aug',
                                 :close_date => DateTime.parse('24-08-2013'))

Competition.find_or_create_by_id(:id => 3,
                                 :week => '201303',
                                 :description => 'Premier League 31st Aug',
                                 :close_date => DateTime.parse('31-08-2013'))

Competition.find_or_create_by_id(:id => 4,
                                 :week => '201304',
                                 :description => 'Premier League 14th Sep',
                                 :close_date => DateTime.parse('14-09-2013'))

Competition.find_or_create_by_id(:id => 5,
                                 :week => '201305',
                                 :description => 'Premier League 21st Sep',
                                 :close_date => DateTime.parse('21-09-2013'))

Competition.find_or_create_by_id(:id => 6,
                                 :week => '201306',
                                 :description => 'Premier League 28th Sep',
                                 :close_date => DateTime.parse('28-09-2013'))

Fixture.find_or_create_by_id(:id => 1,  :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 1,  :away_team_id => 2 , :competition_id => 1)
Fixture.find_or_create_by_id(:id => 2,  :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 4,  :away_team_id => 8 , :competition_id => 1)
Fixture.find_or_create_by_id(:id => 3,  :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 5,  :away_team_id => 18, :competition_id => 1)
Fixture.find_or_create_by_id(:id => 4,  :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 9,  :away_team_id => 15, :competition_id => 1)
Fixture.find_or_create_by_id(:id => 5,  :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 10, :away_team_id => 12, :competition_id => 1)
Fixture.find_or_create_by_id(:id => 6,  :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 13, :away_team_id => 6 , :competition_id => 1)
Fixture.find_or_create_by_id(:id => 7,  :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 16, :away_team_id => 7 , :competition_id => 1)
Fixture.find_or_create_by_id(:id => 8,  :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 17, :away_team_id => 11, :competition_id => 1)
Fixture.find_or_create_by_id(:id => 9,  :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 19, :away_team_id => 14, :competition_id => 1)
Fixture.find_or_create_by_id(:id => 10, :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 20, :away_team_id => 3 , :competition_id => 1)

Fixture.find_or_create_by_id(:id => 11, :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 2,  :away_team_id => 9 , :competition_id => 2)
Fixture.find_or_create_by_id(:id => 12, :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 3,  :away_team_id => 10, :competition_id => 2)
Fixture.find_or_create_by_id(:id => 13, :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 6,  :away_team_id => 19, :competition_id => 2)
Fixture.find_or_create_by_id(:id => 14, :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 7,  :away_team_id => 1 , :competition_id => 2)
Fixture.find_or_create_by_id(:id => 15, :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 8,  :away_team_id => 13, :competition_id => 2)
Fixture.find_or_create_by_id(:id => 16, :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 11, :away_team_id => 4 , :competition_id => 2)
Fixture.find_or_create_by_id(:id => 17, :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 12, :away_team_id => 20, :competition_id => 2)
Fixture.find_or_create_by_id(:id => 18, :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 14, :away_team_id => 16, :competition_id => 2)
Fixture.find_or_create_by_id(:id => 19, :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 15, :away_team_id => 5 , :competition_id => 2)
Fixture.find_or_create_by_id(:id => 20, :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 18, :away_team_id => 17, :competition_id => 2)

Fixture.find_or_create_by_id(:id => 21, :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 1,  :away_team_id => 18, :competition_id => 3)
Fixture.find_or_create_by_id(:id => 22, :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 3,  :away_team_id => 6,  :competition_id => 3)
Fixture.find_or_create_by_id(:id => 23, :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 4,  :away_team_id => 2,  :competition_id => 3)
Fixture.find_or_create_by_id(:id => 24, :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 5,  :away_team_id => 16, :competition_id => 3)
Fixture.find_or_create_by_id(:id => 25, :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 9,  :away_team_id => 11, :competition_id => 3)
Fixture.find_or_create_by_id(:id => 26, :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 10, :away_team_id => 8,  :competition_id => 3)
Fixture.find_or_create_by_id(:id => 27, :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 12, :away_team_id => 7,  :competition_id => 3)
Fixture.find_or_create_by_id(:id => 28, :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 13, :away_team_id => 14, :competition_id => 3)
Fixture.find_or_create_by_id(:id => 29, :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 19, :away_team_id => 17, :competition_id => 3)
Fixture.find_or_create_by_id(:id => 30, :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 20, :away_team_id => 15, :competition_id => 3)

Fixture.find_or_create_by_id(:id => 31, :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 2,  :away_team_id => 12, :competition_id => 4)
Fixture.find_or_create_by_id(:id => 32, :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 6,  :away_team_id => 4,  :competition_id => 4)
Fixture.find_or_create_by_id(:id => 33, :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 7,  :away_team_id => 19, :competition_id => 4)
Fixture.find_or_create_by_id(:id => 34, :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 8,  :away_team_id => 3,  :competition_id => 4)
Fixture.find_or_create_by_id(:id => 35, :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 11, :away_team_id => 5,  :competition_id => 4)
Fixture.find_or_create_by_id(:id => 36, :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 14, :away_team_id => 20, :competition_id => 4)
Fixture.find_or_create_by_id(:id => 37, :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 15, :away_team_id => 10, :competition_id => 4)
Fixture.find_or_create_by_id(:id => 38, :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 16, :away_team_id => 1,  :competition_id => 4)
Fixture.find_or_create_by_id(:id => 39, :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 17, :away_team_id => 9,  :competition_id => 4)
Fixture.find_or_create_by_id(:id => 40, :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 18, :away_team_id => 13, :competition_id => 4)

Fixture.find_or_create_by_id(:id => 41, :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 1,  :away_team_id => 15, :competition_id => 5)
Fixture.find_or_create_by_id(:id => 42, :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 3,  :away_team_id => 18, :competition_id => 5)
Fixture.find_or_create_by_id(:id => 43, :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 4,  :away_team_id => 7,  :competition_id => 5)
Fixture.find_or_create_by_id(:id => 44, :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 5,  :away_team_id => 17, :competition_id => 5)
Fixture.find_or_create_by_id(:id => 45, :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 9,  :away_team_id => 14, :competition_id => 5)
Fixture.find_or_create_by_id(:id => 46, :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 10, :away_team_id => 11, :competition_id => 5)
Fixture.find_or_create_by_id(:id => 47, :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 12, :away_team_id => 8,  :competition_id => 5)
Fixture.find_or_create_by_id(:id => 48, :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 13, :away_team_id => 2,  :competition_id => 5)
Fixture.find_or_create_by_id(:id => 49, :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 19, :away_team_id => 16, :competition_id => 5)
Fixture.find_or_create_by_id(:id => 50, :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 20, :away_team_id => 6,  :competition_id => 5)

Fixture.find_or_create_by_id(:id => 51, :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 2,  :away_team_id => 10, :competition_id => 6)
Fixture.find_or_create_by_id(:id => 52, :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 6,  :away_team_id => 12, :competition_id => 6)
Fixture.find_or_create_by_id(:id => 53, :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 7,  :away_team_id => 3,  :competition_id => 6)
Fixture.find_or_create_by_id(:id => 54, :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 8,  :away_team_id => 20, :competition_id => 6)
Fixture.find_or_create_by_id(:id => 55, :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 11, :away_team_id => 19, :competition_id => 6)
Fixture.find_or_create_by_id(:id => 56, :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 14, :away_team_id => 5,  :competition_id => 6)
Fixture.find_or_create_by_id(:id => 57, :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 15, :away_team_id => 13, :competition_id => 6)
Fixture.find_or_create_by_id(:id => 58, :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 16, :away_team_id => 9,  :competition_id => 6)
Fixture.find_or_create_by_id(:id => 59, :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 17, :away_team_id => 1,  :competition_id => 6)
Fixture.find_or_create_by_id(:id => 60, :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 18, :away_team_id => 4,  :competition_id => 6)

Team.find_or_create_by_id(:id => 1,  :name => 'Arsenal')
Team.find_or_create_by_id(:id => 2,  :name => 'Aston Villa')
Team.find_or_create_by_id(:id => 3,  :name => 'Cardiff')
Team.find_or_create_by_id(:id => 4,  :name => 'Chelsea')
Team.find_or_create_by_id(:id => 5,  :name => 'Crystal Palace')
Team.find_or_create_by_id(:id => 6,  :name => 'Everton')
Team.find_or_create_by_id(:id => 7,  :name => 'Fulham')
Team.find_or_create_by_id(:id => 8,  :name => 'Hull')
Team.find_or_create_by_id(:id => 9,  :name => 'Liverpool')
Team.find_or_create_by_id(:id => 10, :name => 'Man City')
Team.find_or_create_by_id(:id => 11, :name => 'Man Utd')
Team.find_or_create_by_id(:id => 12, :name => 'Newcastle')
Team.find_or_create_by_id(:id => 13, :name => 'Norwich')
Team.find_or_create_by_id(:id => 14, :name => 'Southampton')
Team.find_or_create_by_id(:id => 15, :name => 'Stoke')
Team.find_or_create_by_id(:id => 16, :name => 'Sunderland')
Team.find_or_create_by_id(:id => 17, :name => 'Swansea')
Team.find_or_create_by_id(:id => 18, :name => 'Tottenham')
Team.find_or_create_by_id(:id => 19, :name => 'West Brom')
Team.find_or_create_by_id(:id => 20, :name => 'West Ham')
