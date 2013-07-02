User.delete_all
Competition.delete_all
Fixture.delete_all
Team.delete_all

User.find_or_create_by_username(:id => 1, :username => 'markm',  :password => 'bodie')
User.find_or_create_by_username(:id => 2, :username => 'davidb', :password => 'apple12')
User.find_or_create_by_username(:id => 3, :username => 'andyb',  :password => 'paper47')
User.find_or_create_by_username(:id => 4, :username => 'adams',  :password => 'cloud91')
User.find_or_create_by_username(:id => 5, :username => 'samc',   :password => 'bread33')

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

Competition.find_or_create_by_id(:id => 7,
                                 :week => '201307',
                                 :description => 'Premier League 5th Oct',
                                 :close_date => DateTime.parse('05-10-2013'))

Competition.find_or_create_by_id(:id => 8,
                                 :week => '201308',
                                 :description => 'Premier League 19th Oct',
                                 :close_date => DateTime.parse('19-10-2013'))

Competition.find_or_create_by_id(:id => 9,
                                 :week => '201309',
                                 :description => 'Premier League 26th Oct',
                                 :close_date => DateTime.parse('26-10-2013'))

Competition.find_or_create_by_id(:id => 10,
                                 :week => '201310',
                                 :description => 'Premier League 2nd Nov',
                                 :close_date => DateTime.parse('02-11-2013'))

Competition.find_or_create_by_id(:id => 11,
                                 :week => '201311',
                                 :description => 'Premier League 9th Nov',
                                 :close_date => DateTime.parse('09-11-2013'))

Competition.find_or_create_by_id(:id => 12,
                                 :week => '201312',
                                 :description => 'Premier League 23rd Nov',
                                 :close_date => DateTime.parse('23-11-2013'))

Competition.find_or_create_by_id(:id => 13,
                                 :week => '201313',
                                 :description => 'Premier League 30th Nov',
                                 :close_date => DateTime.parse('30-11-2013'))

Competition.find_or_create_by_id(:id => 14,
                                 :week => '201314',
                                 :description => 'Premier League 3rd Dec',
                                 :close_date => DateTime.parse('03-12-2013'))

Competition.find_or_create_by_id(:id => 15,
                                 :week => '201315',
                                 :description => 'Premier League 7th Dec',
                                 :close_date => DateTime.parse('07-12-2013'))

Competition.find_or_create_by_id(:id => 16,
                                 :week => '201316',
                                 :description => 'Premier League 14th Dec',
                                 :close_date => DateTime.parse('14-12-2013'))

Competition.find_or_create_by_id(:id => 17,
                                 :week => '201317',
                                 :description => 'Premier League 21st Dec',
                                 :close_date => DateTime.parse('21-12-2013'))

Competition.find_or_create_by_id(:id => 18,
                                 :week => '201318',
                                 :description => 'Premier League 26th Dec',
                                 :close_date => DateTime.parse('26-12-2013'))

Competition.find_or_create_by_id(:id => 19,
                                 :week => '201319',
                                 :description => 'Premier League 28th Dec',
                                 :close_date => DateTime.parse('28-12-2013'))

Competition.find_or_create_by_id(:id => 20,
                                 :week => '201320',
                                 :description => 'Premier League 1st Jan',
                                 :close_date => DateTime.parse('01-01-2014'))

Competition.find_or_create_by_id(:id => 21,
                                 :week => '201321',
                                 :description => 'Premier League 11th Jan',
                                 :close_date => DateTime.parse('11-01-2014'))

Competition.find_or_create_by_id(:id => 22,
                                 :week => '201322',
                                 :description => 'Premier League 18th Jan',
                                 :close_date => DateTime.parse('18-01-2014'))

Competition.find_or_create_by_id(:id => 23,
                                 :week => '201323',
                                 :description => 'Premier League 28th Jan',
                                 :close_date => DateTime.parse('28-01-2014'))

Competition.find_or_create_by_id(:id => 24,
                                 :week => '201324',
                                 :description => 'Premier League 1st Feb',
                                 :close_date => DateTime.parse('01-02-2014'))

Competition.find_or_create_by_id(:id => 25,
                                 :week => '201325',
                                 :description => 'Premier League 8th Feb',
                                 :close_date => DateTime.parse('08-02-2014'))

Competition.find_or_create_by_id(:id => 26,
                                 :week => '201326',
                                 :description => 'Premier League 11th Feb',
                                 :close_date => DateTime.parse('11-02-2014'))

Competition.find_or_create_by_id(:id => 27,
                                 :week => '201327',
                                 :description => 'Premier League 22nd Feb',
                                 :close_date => DateTime.parse('22-02-2014'))

Competition.find_or_create_by_id(:id => 28,
                                 :week => '201328',
                                 :description => 'Premier League 1st Mar',
                                 :close_date => DateTime.parse('01-03-2014'))

Competition.find_or_create_by_id(:id => 29,
                                 :week => '201329',
                                 :description => 'Premier League 8th Mar',
                                 :close_date => DateTime.parse('08-03-2014'))

Competition.find_or_create_by_id(:id => 30,
                                 :week => '201330',
                                 :description => 'Premier League 15th Mar',
                                 :close_date => DateTime.parse('15-03-2014'))

Competition.find_or_create_by_id(:id => 31,
                                 :week => '201331',
                                 :description => 'Premier League 22nd Mar',
                                 :close_date => DateTime.parse('22-03-2014'))

Competition.find_or_create_by_id(:id => 32,
                                 :week => '201332',
                                 :description => 'Premier League 29th Mar',
                                 :close_date => DateTime.parse('29-03-2014'))

Competition.find_or_create_by_id(:id => 33,
                                 :week => '201333',
                                 :description => 'Premier League 5th Apr',
                                 :close_date => DateTime.parse('05-04-2014'))

Competition.find_or_create_by_id(:id => 34,
                                 :week => '201334',
                                 :description => 'Premier League 12th Apr',
                                 :close_date => DateTime.parse('12-04-2014'))

Competition.find_or_create_by_id(:id => 35,
                                 :week => '201335',
                                 :description => 'Premier League 19th Apr',
                                 :close_date => DateTime.parse('19-04-2014'))

Competition.find_or_create_by_id(:id => 36,
                                 :week => '201336',
                                 :description => 'Premier League 26th Apr',
                                 :close_date => DateTime.parse('26-04-2014'))

Competition.find_or_create_by_id(:id => 37,
                                 :week => '201337',
                                 :description => 'Premier League 3rd May',
                                 :close_date => DateTime.parse('03-05-2014'))

Competition.find_or_create_by_id(:id => 38,
                                 :week => '201338',
                                 :description => 'Premier League 11th May',
                                 :close_date => DateTime.parse('11-05-2014'))

Fixture.find_or_create_by_id(:id => 1,   :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 1,  :away_team_id => 2 , :competition_id => 1)
Fixture.find_or_create_by_id(:id => 2,   :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 4,  :away_team_id => 8 , :competition_id => 1)
Fixture.find_or_create_by_id(:id => 3,   :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 5,  :away_team_id => 18, :competition_id => 1)
Fixture.find_or_create_by_id(:id => 4,   :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 9,  :away_team_id => 15, :competition_id => 1)
Fixture.find_or_create_by_id(:id => 5,   :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 10, :away_team_id => 12, :competition_id => 1)
Fixture.find_or_create_by_id(:id => 6,   :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 13, :away_team_id => 6 , :competition_id => 1)
Fixture.find_or_create_by_id(:id => 7,   :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 16, :away_team_id => 7 , :competition_id => 1)
Fixture.find_or_create_by_id(:id => 8,   :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 17, :away_team_id => 11, :competition_id => 1)
Fixture.find_or_create_by_id(:id => 9,   :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 19, :away_team_id => 14, :competition_id => 1)
Fixture.find_or_create_by_id(:id => 10,  :kickoff => DateTime.parse('2013-08-17 15:00:00'), :home_team_id => 20, :away_team_id => 3 , :competition_id => 1)

Fixture.find_or_create_by_id(:id => 11,  :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 2,  :away_team_id => 9 , :competition_id => 2)
Fixture.find_or_create_by_id(:id => 12,  :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 3,  :away_team_id => 10, :competition_id => 2)
Fixture.find_or_create_by_id(:id => 13,  :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 6,  :away_team_id => 19, :competition_id => 2)
Fixture.find_or_create_by_id(:id => 14,  :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 7,  :away_team_id => 1 , :competition_id => 2)
Fixture.find_or_create_by_id(:id => 15,  :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 8,  :away_team_id => 13, :competition_id => 2)
Fixture.find_or_create_by_id(:id => 16,  :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 11, :away_team_id => 4 , :competition_id => 2)
Fixture.find_or_create_by_id(:id => 17,  :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 12, :away_team_id => 20, :competition_id => 2)
Fixture.find_or_create_by_id(:id => 18,  :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 14, :away_team_id => 16, :competition_id => 2)
Fixture.find_or_create_by_id(:id => 19,  :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 15, :away_team_id => 5 , :competition_id => 2)
Fixture.find_or_create_by_id(:id => 20,  :kickoff => DateTime.parse('2013-08-24 15:00:00'), :home_team_id => 18, :away_team_id => 17, :competition_id => 2)

Fixture.find_or_create_by_id(:id => 21,  :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 1,  :away_team_id => 18, :competition_id => 3)
Fixture.find_or_create_by_id(:id => 22,  :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 3,  :away_team_id => 6,  :competition_id => 3)
Fixture.find_or_create_by_id(:id => 23,  :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 4,  :away_team_id => 2,  :competition_id => 3)
Fixture.find_or_create_by_id(:id => 24,  :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 5,  :away_team_id => 16, :competition_id => 3)
Fixture.find_or_create_by_id(:id => 25,  :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 9,  :away_team_id => 11, :competition_id => 3)
Fixture.find_or_create_by_id(:id => 26,  :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 10, :away_team_id => 8,  :competition_id => 3)
Fixture.find_or_create_by_id(:id => 27,  :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 12, :away_team_id => 7,  :competition_id => 3)
Fixture.find_or_create_by_id(:id => 28,  :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 13, :away_team_id => 14, :competition_id => 3)
Fixture.find_or_create_by_id(:id => 29,  :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 19, :away_team_id => 17, :competition_id => 3)
Fixture.find_or_create_by_id(:id => 30,  :kickoff => DateTime.parse('2013-08-31 15:00:00'), :home_team_id => 20, :away_team_id => 15, :competition_id => 3)

Fixture.find_or_create_by_id(:id => 31,  :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 2,  :away_team_id => 12, :competition_id => 4)
Fixture.find_or_create_by_id(:id => 32,  :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 6,  :away_team_id => 4,  :competition_id => 4)
Fixture.find_or_create_by_id(:id => 33,  :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 7,  :away_team_id => 19, :competition_id => 4)
Fixture.find_or_create_by_id(:id => 34,  :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 8,  :away_team_id => 3,  :competition_id => 4)
Fixture.find_or_create_by_id(:id => 35,  :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 11, :away_team_id => 5,  :competition_id => 4)
Fixture.find_or_create_by_id(:id => 36,  :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 14, :away_team_id => 20, :competition_id => 4)
Fixture.find_or_create_by_id(:id => 37,  :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 15, :away_team_id => 10, :competition_id => 4)
Fixture.find_or_create_by_id(:id => 38,  :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 16, :away_team_id => 1,  :competition_id => 4)
Fixture.find_or_create_by_id(:id => 39,  :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 17, :away_team_id => 9,  :competition_id => 4)
Fixture.find_or_create_by_id(:id => 40,  :kickoff => DateTime.parse('2013-09-14 15:00:00'), :home_team_id => 18, :away_team_id => 13, :competition_id => 4)

Fixture.find_or_create_by_id(:id => 41,  :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 1,  :away_team_id => 15, :competition_id => 5)
Fixture.find_or_create_by_id(:id => 42,  :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 3,  :away_team_id => 18, :competition_id => 5)
Fixture.find_or_create_by_id(:id => 43,  :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 4,  :away_team_id => 7,  :competition_id => 5)
Fixture.find_or_create_by_id(:id => 44,  :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 5,  :away_team_id => 17, :competition_id => 5)
Fixture.find_or_create_by_id(:id => 45,  :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 9,  :away_team_id => 14, :competition_id => 5)
Fixture.find_or_create_by_id(:id => 46,  :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 10, :away_team_id => 11, :competition_id => 5)
Fixture.find_or_create_by_id(:id => 47,  :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 12, :away_team_id => 8,  :competition_id => 5)
Fixture.find_or_create_by_id(:id => 48,  :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 13, :away_team_id => 2,  :competition_id => 5)
Fixture.find_or_create_by_id(:id => 49,  :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 19, :away_team_id => 16, :competition_id => 5)
Fixture.find_or_create_by_id(:id => 50,  :kickoff => DateTime.parse('2013-09-21 15:00:00'), :home_team_id => 20, :away_team_id => 6,  :competition_id => 5)

Fixture.find_or_create_by_id(:id => 51,  :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 2,  :away_team_id => 10, :competition_id => 6)
Fixture.find_or_create_by_id(:id => 52,  :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 6,  :away_team_id => 12, :competition_id => 6)
Fixture.find_or_create_by_id(:id => 53,  :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 7,  :away_team_id => 3,  :competition_id => 6)
Fixture.find_or_create_by_id(:id => 54,  :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 8,  :away_team_id => 20, :competition_id => 6)
Fixture.find_or_create_by_id(:id => 55,  :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 11, :away_team_id => 19, :competition_id => 6)
Fixture.find_or_create_by_id(:id => 56,  :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 14, :away_team_id => 5,  :competition_id => 6)
Fixture.find_or_create_by_id(:id => 57,  :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 15, :away_team_id => 13, :competition_id => 6)
Fixture.find_or_create_by_id(:id => 58,  :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 16, :away_team_id => 9,  :competition_id => 6)
Fixture.find_or_create_by_id(:id => 59,  :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 17, :away_team_id => 1,  :competition_id => 6)
Fixture.find_or_create_by_id(:id => 60,  :kickoff => DateTime.parse('2013-09-28 15:00:00'), :home_team_id => 18, :away_team_id => 4,  :competition_id => 6)

Fixture.find_or_create_by_id(:id => 61,  :kickoff => DateTime.parse('2013-10-05 15:00:00'), :home_team_id => 3,  :away_team_id => 12, :competition_id => 7)
Fixture.find_or_create_by_id(:id => 62,  :kickoff => DateTime.parse('2013-10-05 15:00:00'), :home_team_id => 7,  :away_team_id => 15, :competition_id => 7)
Fixture.find_or_create_by_id(:id => 63,  :kickoff => DateTime.parse('2013-10-05 15:00:00'), :home_team_id => 8,  :away_team_id => 2,  :competition_id => 7)
Fixture.find_or_create_by_id(:id => 64,  :kickoff => DateTime.parse('2013-10-05 15:00:00'), :home_team_id => 9,  :away_team_id => 5,  :competition_id => 7)
Fixture.find_or_create_by_id(:id => 65,  :kickoff => DateTime.parse('2013-10-05 15:00:00'), :home_team_id => 10, :away_team_id => 6,  :competition_id => 7)
Fixture.find_or_create_by_id(:id => 66,  :kickoff => DateTime.parse('2013-10-05 15:00:00'), :home_team_id => 13, :away_team_id => 4,  :competition_id => 7)
Fixture.find_or_create_by_id(:id => 67,  :kickoff => DateTime.parse('2013-10-05 15:00:00'), :home_team_id => 14, :away_team_id => 17, :competition_id => 7)
Fixture.find_or_create_by_id(:id => 68,  :kickoff => DateTime.parse('2013-10-05 15:00:00'), :home_team_id => 16, :away_team_id => 11, :competition_id => 7)
Fixture.find_or_create_by_id(:id => 69,  :kickoff => DateTime.parse('2013-10-05 15:00:00'), :home_team_id => 18, :away_team_id => 20, :competition_id => 7)
Fixture.find_or_create_by_id(:id => 70,  :kickoff => DateTime.parse('2013-10-05 15:00:00'), :home_team_id => 19, :away_team_id => 1,  :competition_id => 7)

Fixture.find_or_create_by_id(:id => 71,  :kickoff => DateTime.parse('2013-10-19 15:00:00'), :home_team_id => 1,  :away_team_id => 13, :competition_id => 8)
Fixture.find_or_create_by_id(:id => 72,  :kickoff => DateTime.parse('2013-10-19 15:00:00'), :home_team_id => 2,  :away_team_id => 18, :competition_id => 8)
Fixture.find_or_create_by_id(:id => 73,  :kickoff => DateTime.parse('2013-10-19 15:00:00'), :home_team_id => 4,  :away_team_id => 3,  :competition_id => 8)
Fixture.find_or_create_by_id(:id => 74,  :kickoff => DateTime.parse('2013-10-19 15:00:00'), :home_team_id => 5,  :away_team_id => 7,  :competition_id => 8)
Fixture.find_or_create_by_id(:id => 75,  :kickoff => DateTime.parse('2013-10-19 15:00:00'), :home_team_id => 6,  :away_team_id => 8,  :competition_id => 8)
Fixture.find_or_create_by_id(:id => 76,  :kickoff => DateTime.parse('2013-10-19 15:00:00'), :home_team_id => 11, :away_team_id => 14, :competition_id => 8)
Fixture.find_or_create_by_id(:id => 77,  :kickoff => DateTime.parse('2013-10-19 15:00:00'), :home_team_id => 12, :away_team_id => 9,  :competition_id => 8)
Fixture.find_or_create_by_id(:id => 78,  :kickoff => DateTime.parse('2013-10-19 15:00:00'), :home_team_id => 15, :away_team_id => 19, :competition_id => 8)
Fixture.find_or_create_by_id(:id => 79,  :kickoff => DateTime.parse('2013-10-19 15:00:00'), :home_team_id => 17, :away_team_id => 16, :competition_id => 8)
Fixture.find_or_create_by_id(:id => 80,  :kickoff => DateTime.parse('2013-10-19 15:00:00'), :home_team_id => 20, :away_team_id => 10, :competition_id => 8)

Fixture.find_or_create_by_id(:id => 81,  :kickoff => DateTime.parse('2013-10-26 15:00:00'), :home_team_id => 2,  :away_team_id => 6,  :competition_id => 9)
Fixture.find_or_create_by_id(:id => 82,  :kickoff => DateTime.parse('2013-10-26 15:00:00'), :home_team_id => 4,  :away_team_id => 10, :competition_id => 9)
Fixture.find_or_create_by_id(:id => 83,  :kickoff => DateTime.parse('2013-10-26 15:00:00'), :home_team_id => 5,  :away_team_id => 1,  :competition_id => 9)
Fixture.find_or_create_by_id(:id => 84,  :kickoff => DateTime.parse('2013-10-26 15:00:00'), :home_team_id => 9,  :away_team_id => 19, :competition_id => 9)
Fixture.find_or_create_by_id(:id => 85,  :kickoff => DateTime.parse('2013-10-26 15:00:00'), :home_team_id => 11, :away_team_id => 15, :competition_id => 9)
Fixture.find_or_create_by_id(:id => 86,  :kickoff => DateTime.parse('2013-10-26 15:00:00'), :home_team_id => 13, :away_team_id => 3,  :competition_id => 9)
Fixture.find_or_create_by_id(:id => 87,  :kickoff => DateTime.parse('2013-10-26 15:00:00'), :home_team_id => 14, :away_team_id => 7,  :competition_id => 9)
Fixture.find_or_create_by_id(:id => 88,  :kickoff => DateTime.parse('2013-10-26 15:00:00'), :home_team_id => 16, :away_team_id => 12, :competition_id => 9)
Fixture.find_or_create_by_id(:id => 89,  :kickoff => DateTime.parse('2013-10-26 15:00:00'), :home_team_id => 17, :away_team_id => 20, :competition_id => 9)
Fixture.find_or_create_by_id(:id => 90,  :kickoff => DateTime.parse('2013-10-26 15:00:00'), :home_team_id => 18, :away_team_id => 8,  :competition_id => 9)

Fixture.find_or_create_by_id(:id => 91,  :kickoff => DateTime.parse('2013-11-02 15:00:00'), :home_team_id => 1,  :away_team_id => 9,  :competition_id => 10)
Fixture.find_or_create_by_id(:id => 92,  :kickoff => DateTime.parse('2013-11-02 15:00:00'), :home_team_id => 3,  :away_team_id => 17, :competition_id => 10)
Fixture.find_or_create_by_id(:id => 93,  :kickoff => DateTime.parse('2013-11-02 15:00:00'), :home_team_id => 6,  :away_team_id => 18, :competition_id => 10)
Fixture.find_or_create_by_id(:id => 94,  :kickoff => DateTime.parse('2013-11-02 15:00:00'), :home_team_id => 7,  :away_team_id => 11, :competition_id => 10)
Fixture.find_or_create_by_id(:id => 95,  :kickoff => DateTime.parse('2013-11-02 15:00:00'), :home_team_id => 8,  :away_team_id => 16, :competition_id => 10)
Fixture.find_or_create_by_id(:id => 96,  :kickoff => DateTime.parse('2013-11-02 15:00:00'), :home_team_id => 10, :away_team_id => 13, :competition_id => 10)
Fixture.find_or_create_by_id(:id => 97,  :kickoff => DateTime.parse('2013-11-02 15:00:00'), :home_team_id => 12, :away_team_id => 4,  :competition_id => 10)
Fixture.find_or_create_by_id(:id => 98,  :kickoff => DateTime.parse('2013-11-02 15:00:00'), :home_team_id => 15, :away_team_id => 14, :competition_id => 10)
Fixture.find_or_create_by_id(:id => 99,  :kickoff => DateTime.parse('2013-11-02 15:00:00'), :home_team_id => 19, :away_team_id => 5,  :competition_id => 10)
Fixture.find_or_create_by_id(:id => 100, :kickoff => DateTime.parse('2013-11-02 15:00:00'), :home_team_id => 20, :away_team_id => 2,  :competition_id => 10)

Fixture.find_or_create_by_id(:id => 101, :kickoff => DateTime.parse('2013-11-09 15:00:00'), :home_team_id => 2,  :away_team_id => 3,  :competition_id => 11)
Fixture.find_or_create_by_id(:id => 102, :kickoff => DateTime.parse('2013-11-09 15:00:00'), :home_team_id => 4,  :away_team_id => 19, :competition_id => 11)
Fixture.find_or_create_by_id(:id => 103, :kickoff => DateTime.parse('2013-11-09 15:00:00'), :home_team_id => 5,  :away_team_id => 6,  :competition_id => 11)
Fixture.find_or_create_by_id(:id => 104, :kickoff => DateTime.parse('2013-11-09 15:00:00'), :home_team_id => 9,  :away_team_id => 7,  :competition_id => 11)
Fixture.find_or_create_by_id(:id => 105, :kickoff => DateTime.parse('2013-11-09 15:00:00'), :home_team_id => 11, :away_team_id => 1,  :competition_id => 11)
Fixture.find_or_create_by_id(:id => 106, :kickoff => DateTime.parse('2013-11-09 15:00:00'), :home_team_id => 13, :away_team_id => 20, :competition_id => 11)
Fixture.find_or_create_by_id(:id => 107, :kickoff => DateTime.parse('2013-11-09 15:00:00'), :home_team_id => 14, :away_team_id => 8,  :competition_id => 11)
Fixture.find_or_create_by_id(:id => 108, :kickoff => DateTime.parse('2013-11-09 15:00:00'), :home_team_id => 16, :away_team_id => 10, :competition_id => 11)
Fixture.find_or_create_by_id(:id => 109, :kickoff => DateTime.parse('2013-11-09 15:00:00'), :home_team_id => 17, :away_team_id => 15, :competition_id => 11)
Fixture.find_or_create_by_id(:id => 110, :kickoff => DateTime.parse('2013-11-09 15:00:00'), :home_team_id => 18, :away_team_id => 12, :competition_id => 11)

Fixture.find_or_create_by_id(:id => 111, :kickoff => DateTime.parse('2013-11-23 15:00:00'), :home_team_id => 1,  :away_team_id => 14, :competition_id => 12)
Fixture.find_or_create_by_id(:id => 112, :kickoff => DateTime.parse('2013-11-23 15:00:00'), :home_team_id => 3,  :away_team_id => 11, :competition_id => 12)
Fixture.find_or_create_by_id(:id => 113, :kickoff => DateTime.parse('2013-11-23 15:00:00'), :home_team_id => 6,  :away_team_id => 9,  :competition_id => 12)
Fixture.find_or_create_by_id(:id => 114, :kickoff => DateTime.parse('2013-11-23 15:00:00'), :home_team_id => 7,  :away_team_id => 17, :competition_id => 12)
Fixture.find_or_create_by_id(:id => 115, :kickoff => DateTime.parse('2013-11-23 15:00:00'), :home_team_id => 8,  :away_team_id => 5,  :competition_id => 12)
Fixture.find_or_create_by_id(:id => 116, :kickoff => DateTime.parse('2013-11-23 15:00:00'), :home_team_id => 10, :away_team_id => 18, :competition_id => 12)
Fixture.find_or_create_by_id(:id => 117, :kickoff => DateTime.parse('2013-11-23 15:00:00'), :home_team_id => 12, :away_team_id => 13, :competition_id => 12)
Fixture.find_or_create_by_id(:id => 118, :kickoff => DateTime.parse('2013-11-23 15:00:00'), :home_team_id => 15, :away_team_id => 16, :competition_id => 12)
Fixture.find_or_create_by_id(:id => 119, :kickoff => DateTime.parse('2013-11-23 15:00:00'), :home_team_id => 19, :away_team_id => 2,  :competition_id => 12)
Fixture.find_or_create_by_id(:id => 120, :kickoff => DateTime.parse('2013-11-23 15:00:00'), :home_team_id => 20, :away_team_id => 4,  :competition_id => 12)

Fixture.find_or_create_by_id(:id => 121, :kickoff => DateTime.parse('2013-11-30 15:00:00'), :home_team_id => 2,  :away_team_id => 16, :competition_id => 13)
Fixture.find_or_create_by_id(:id => 122, :kickoff => DateTime.parse('2013-11-30 15:00:00'), :home_team_id => 3,  :away_team_id => 1,  :competition_id => 13)
Fixture.find_or_create_by_id(:id => 123, :kickoff => DateTime.parse('2013-11-30 15:00:00'), :home_team_id => 4,  :away_team_id => 14, :competition_id => 13)
Fixture.find_or_create_by_id(:id => 124, :kickoff => DateTime.parse('2013-11-30 15:00:00'), :home_team_id => 6,  :away_team_id => 15, :competition_id => 13)
Fixture.find_or_create_by_id(:id => 125, :kickoff => DateTime.parse('2013-11-30 15:00:00'), :home_team_id => 8,  :away_team_id => 9,  :competition_id => 13)
Fixture.find_or_create_by_id(:id => 126, :kickoff => DateTime.parse('2013-11-30 15:00:00'), :home_team_id => 10, :away_team_id => 17, :competition_id => 13)
Fixture.find_or_create_by_id(:id => 127, :kickoff => DateTime.parse('2013-11-30 15:00:00'), :home_team_id => 12, :away_team_id => 19, :competition_id => 13)
Fixture.find_or_create_by_id(:id => 128, :kickoff => DateTime.parse('2013-11-30 15:00:00'), :home_team_id => 13, :away_team_id => 5,  :competition_id => 13)
Fixture.find_or_create_by_id(:id => 129, :kickoff => DateTime.parse('2013-11-30 15:00:00'), :home_team_id => 18, :away_team_id => 11, :competition_id => 13)
Fixture.find_or_create_by_id(:id => 130, :kickoff => DateTime.parse('2013-11-30 15:00:00'), :home_team_id => 20, :away_team_id => 7,  :competition_id => 13)

Fixture.find_or_create_by_id(:id => 131, :kickoff => DateTime.parse('2013-12-03 19:45:00'), :home_team_id => 1,  :away_team_id => 8,  :competition_id => 14)
Fixture.find_or_create_by_id(:id => 132, :kickoff => DateTime.parse('2013-12-03 19:45:00'), :home_team_id => 11, :away_team_id => 6,  :competition_id => 14)
Fixture.find_or_create_by_id(:id => 133, :kickoff => DateTime.parse('2013-12-03 19:45:00'), :home_team_id => 14, :away_team_id => 2,  :competition_id => 14)
Fixture.find_or_create_by_id(:id => 134, :kickoff => DateTime.parse('2013-12-03 19:45:00'), :home_team_id => 15, :away_team_id => 3,  :competition_id => 14)
Fixture.find_or_create_by_id(:id => 135, :kickoff => DateTime.parse('2013-12-03 19:45:00'), :home_team_id => 16, :away_team_id => 4,  :competition_id => 14)
Fixture.find_or_create_by_id(:id => 136, :kickoff => DateTime.parse('2013-12-03 19:45:00'), :home_team_id => 17, :away_team_id => 12, :competition_id => 14)
Fixture.find_or_create_by_id(:id => 137, :kickoff => DateTime.parse('2013-12-03 20:00:00'), :home_team_id => 5,  :away_team_id => 20, :competition_id => 14)
Fixture.find_or_create_by_id(:id => 138, :kickoff => DateTime.parse('2013-12-03 20:00:00'), :home_team_id => 9,  :away_team_id => 13, :competition_id => 14)
Fixture.find_or_create_by_id(:id => 139, :kickoff => DateTime.parse('2013-12-03 20:00:00'), :home_team_id => 19, :away_team_id => 10, :competition_id => 14)
Fixture.find_or_create_by_id(:id => 140, :kickoff => DateTime.parse('2013-12-04 20:00:00'), :home_team_id => 7,  :away_team_id => 18, :competition_id => 14)

Fixture.find_or_create_by_id(:id => 141, :kickoff => DateTime.parse('2013-12-07 15:00:00'), :home_team_id => 1,  :away_team_id => 6,  :competition_id => 15)
Fixture.find_or_create_by_id(:id => 142, :kickoff => DateTime.parse('2013-12-07 15:00:00'), :home_team_id => 5,  :away_team_id => 3,  :competition_id => 15)
Fixture.find_or_create_by_id(:id => 143, :kickoff => DateTime.parse('2013-12-07 15:00:00'), :home_team_id => 7,  :away_team_id => 2,  :competition_id => 15)
Fixture.find_or_create_by_id(:id => 144, :kickoff => DateTime.parse('2013-12-07 15:00:00'), :home_team_id => 9,  :away_team_id => 20, :competition_id => 15)
Fixture.find_or_create_by_id(:id => 145, :kickoff => DateTime.parse('2013-12-07 15:00:00'), :home_team_id => 11, :away_team_id => 12, :competition_id => 15)
Fixture.find_or_create_by_id(:id => 146, :kickoff => DateTime.parse('2013-12-07 15:00:00'), :home_team_id => 14, :away_team_id => 10, :competition_id => 15)
Fixture.find_or_create_by_id(:id => 147, :kickoff => DateTime.parse('2013-12-07 15:00:00'), :home_team_id => 15, :away_team_id => 4,  :competition_id => 15)
Fixture.find_or_create_by_id(:id => 148, :kickoff => DateTime.parse('2013-12-07 15:00:00'), :home_team_id => 16, :away_team_id => 18, :competition_id => 15)
Fixture.find_or_create_by_id(:id => 149, :kickoff => DateTime.parse('2013-12-07 15:00:00'), :home_team_id => 17, :away_team_id => 8,  :competition_id => 15)
Fixture.find_or_create_by_id(:id => 150, :kickoff => DateTime.parse('2013-12-07 15:00:00'), :home_team_id => 19, :away_team_id => 13, :competition_id => 15)

Fixture.find_or_create_by_id(:id => 151, :kickoff => DateTime.parse('2013-12-14 15:00:00'), :home_team_id => 2,  :away_team_id => 11, :competition_id => 16)
Fixture.find_or_create_by_id(:id => 152, :kickoff => DateTime.parse('2013-12-14 15:00:00'), :home_team_id => 3,  :away_team_id => 19, :competition_id => 16)
Fixture.find_or_create_by_id(:id => 153, :kickoff => DateTime.parse('2013-12-14 15:00:00'), :home_team_id => 4,  :away_team_id => 5,  :competition_id => 16)
Fixture.find_or_create_by_id(:id => 154, :kickoff => DateTime.parse('2013-12-14 15:00:00'), :home_team_id => 6,  :away_team_id => 7,  :competition_id => 16)
Fixture.find_or_create_by_id(:id => 155, :kickoff => DateTime.parse('2013-12-14 15:00:00'), :home_team_id => 8,  :away_team_id => 15, :competition_id => 16)
Fixture.find_or_create_by_id(:id => 156, :kickoff => DateTime.parse('2013-12-14 15:00:00'), :home_team_id => 10, :away_team_id => 1,  :competition_id => 16)
Fixture.find_or_create_by_id(:id => 157, :kickoff => DateTime.parse('2013-12-14 15:00:00'), :home_team_id => 12, :away_team_id => 14, :competition_id => 16)
Fixture.find_or_create_by_id(:id => 158, :kickoff => DateTime.parse('2013-12-14 15:00:00'), :home_team_id => 13, :away_team_id => 17, :competition_id => 16)
Fixture.find_or_create_by_id(:id => 159, :kickoff => DateTime.parse('2013-12-14 15:00:00'), :home_team_id => 18, :away_team_id => 9,  :competition_id => 16)
Fixture.find_or_create_by_id(:id => 160, :kickoff => DateTime.parse('2013-12-14 15:00:00'), :home_team_id => 20, :away_team_id => 16, :competition_id => 16)

Fixture.find_or_create_by_id(:id => 161, :kickoff => DateTime.parse('2013-12-21 15:00:00'), :home_team_id => 1,  :away_team_id => 4,  :competition_id => 17)
Fixture.find_or_create_by_id(:id => 162, :kickoff => DateTime.parse('2013-12-21 15:00:00'), :home_team_id => 5,  :away_team_id => 12, :competition_id => 17)
Fixture.find_or_create_by_id(:id => 163, :kickoff => DateTime.parse('2013-12-21 15:00:00'), :home_team_id => 7,  :away_team_id => 10, :competition_id => 17)
Fixture.find_or_create_by_id(:id => 164, :kickoff => DateTime.parse('2013-12-21 15:00:00'), :home_team_id => 9,  :away_team_id => 3,  :competition_id => 17)
Fixture.find_or_create_by_id(:id => 165, :kickoff => DateTime.parse('2013-12-21 15:00:00'), :home_team_id => 11, :away_team_id => 20, :competition_id => 17)
Fixture.find_or_create_by_id(:id => 166, :kickoff => DateTime.parse('2013-12-21 15:00:00'), :home_team_id => 14, :away_team_id => 18, :competition_id => 17)
Fixture.find_or_create_by_id(:id => 167, :kickoff => DateTime.parse('2013-12-21 15:00:00'), :home_team_id => 15, :away_team_id => 2,  :competition_id => 17)
Fixture.find_or_create_by_id(:id => 168, :kickoff => DateTime.parse('2013-12-21 15:00:00'), :home_team_id => 16, :away_team_id => 13, :competition_id => 17)
Fixture.find_or_create_by_id(:id => 169, :kickoff => DateTime.parse('2013-12-21 15:00:00'), :home_team_id => 17, :away_team_id => 6,  :competition_id => 17)
Fixture.find_or_create_by_id(:id => 170, :kickoff => DateTime.parse('2013-12-21 15:00:00'), :home_team_id => 19, :away_team_id => 8,  :competition_id => 17)

Fixture.find_or_create_by_id(:id => 171, :kickoff => DateTime.parse('2013-12-26 15:00:00'), :home_team_id => 2,  :away_team_id => 5,  :competition_id => 18)
Fixture.find_or_create_by_id(:id => 172, :kickoff => DateTime.parse('2013-12-26 15:00:00'), :home_team_id => 3,  :away_team_id => 14, :competition_id => 18)
Fixture.find_or_create_by_id(:id => 173, :kickoff => DateTime.parse('2013-12-26 15:00:00'), :home_team_id => 4,  :away_team_id => 17, :competition_id => 18)
Fixture.find_or_create_by_id(:id => 174, :kickoff => DateTime.parse('2013-12-26 15:00:00'), :home_team_id => 6,  :away_team_id => 16, :competition_id => 18)
Fixture.find_or_create_by_id(:id => 175, :kickoff => DateTime.parse('2013-12-26 15:00:00'), :home_team_id => 8,  :away_team_id => 11, :competition_id => 18)
Fixture.find_or_create_by_id(:id => 176, :kickoff => DateTime.parse('2013-12-26 15:00:00'), :home_team_id => 10, :away_team_id => 9,  :competition_id => 18)
Fixture.find_or_create_by_id(:id => 177, :kickoff => DateTime.parse('2013-12-26 15:00:00'), :home_team_id => 12, :away_team_id => 15, :competition_id => 18)
Fixture.find_or_create_by_id(:id => 178, :kickoff => DateTime.parse('2013-12-26 15:00:00'), :home_team_id => 13, :away_team_id => 7,  :competition_id => 18)
Fixture.find_or_create_by_id(:id => 179, :kickoff => DateTime.parse('2013-12-26 15:00:00'), :home_team_id => 18, :away_team_id => 19, :competition_id => 18)
Fixture.find_or_create_by_id(:id => 180, :kickoff => DateTime.parse('2013-12-26 15:00:00'), :home_team_id => 20, :away_team_id => 1,  :competition_id => 18)

Fixture.find_or_create_by_id(:id => 181, :kickoff => DateTime.parse('2013-12-28 15:00:00'), :home_team_id => 2,  :away_team_id => 17, :competition_id => 19)
Fixture.find_or_create_by_id(:id => 182, :kickoff => DateTime.parse('2013-12-28 15:00:00'), :home_team_id => 3,  :away_team_id => 16, :competition_id => 19)
Fixture.find_or_create_by_id(:id => 183, :kickoff => DateTime.parse('2013-12-28 15:00:00'), :home_team_id => 4,  :away_team_id => 9,  :competition_id => 19)
Fixture.find_or_create_by_id(:id => 184, :kickoff => DateTime.parse('2013-12-28 15:00:00'), :home_team_id => 6,  :away_team_id => 14, :competition_id => 19)
Fixture.find_or_create_by_id(:id => 185, :kickoff => DateTime.parse('2013-12-28 15:00:00'), :home_team_id => 8,  :away_team_id => 7,  :competition_id => 19)
Fixture.find_or_create_by_id(:id => 186, :kickoff => DateTime.parse('2013-12-28 15:00:00'), :home_team_id => 10, :away_team_id => 5,  :competition_id => 19)
Fixture.find_or_create_by_id(:id => 187, :kickoff => DateTime.parse('2013-12-28 15:00:00'), :home_team_id => 12, :away_team_id => 1,  :competition_id => 19)
Fixture.find_or_create_by_id(:id => 188, :kickoff => DateTime.parse('2013-12-28 15:00:00'), :home_team_id => 13, :away_team_id => 11, :competition_id => 19)
Fixture.find_or_create_by_id(:id => 189, :kickoff => DateTime.parse('2013-12-28 15:00:00'), :home_team_id => 18, :away_team_id => 15, :competition_id => 19)
Fixture.find_or_create_by_id(:id => 190, :kickoff => DateTime.parse('2013-12-28 15:00:00'), :home_team_id => 20, :away_team_id => 19, :competition_id => 19)

Fixture.find_or_create_by_id(:id => 191, :kickoff => DateTime.parse('2014-01-01 15:00:00'), :home_team_id => 1,  :away_team_id => 3,  :competition_id => 20)
Fixture.find_or_create_by_id(:id => 192, :kickoff => DateTime.parse('2014-01-01 15:00:00'), :home_team_id => 5,  :away_team_id => 13, :competition_id => 20)
Fixture.find_or_create_by_id(:id => 193, :kickoff => DateTime.parse('2014-01-01 15:00:00'), :home_team_id => 7,  :away_team_id => 20, :competition_id => 20)
Fixture.find_or_create_by_id(:id => 194, :kickoff => DateTime.parse('2014-01-01 15:00:00'), :home_team_id => 9,  :away_team_id => 8,  :competition_id => 20)
Fixture.find_or_create_by_id(:id => 195, :kickoff => DateTime.parse('2014-01-01 15:00:00'), :home_team_id => 11, :away_team_id => 18, :competition_id => 20)
Fixture.find_or_create_by_id(:id => 196, :kickoff => DateTime.parse('2014-01-01 15:00:00'), :home_team_id => 14, :away_team_id => 4,  :competition_id => 20)
Fixture.find_or_create_by_id(:id => 197, :kickoff => DateTime.parse('2014-01-01 15:00:00'), :home_team_id => 15, :away_team_id => 6,  :competition_id => 20)
Fixture.find_or_create_by_id(:id => 198, :kickoff => DateTime.parse('2014-01-01 15:00:00'), :home_team_id => 16, :away_team_id => 2,  :competition_id => 20)
Fixture.find_or_create_by_id(:id => 199, :kickoff => DateTime.parse('2014-01-01 15:00:00'), :home_team_id => 17, :away_team_id => 10, :competition_id => 20)
Fixture.find_or_create_by_id(:id => 200, :kickoff => DateTime.parse('2014-01-01 15:00:00'), :home_team_id => 19, :away_team_id => 12, :competition_id => 20)

Fixture.find_or_create_by_id(:id => 201, :kickoff => DateTime.parse('2014-01-11 15:00:00'), :home_team_id => 2,  :away_team_id => 1,  :competition_id => 21)
Fixture.find_or_create_by_id(:id => 202, :kickoff => DateTime.parse('2014-01-11 15:00:00'), :home_team_id => 3,  :away_team_id => 20, :competition_id => 21)
Fixture.find_or_create_by_id(:id => 203, :kickoff => DateTime.parse('2014-01-11 15:00:00'), :home_team_id => 6,  :away_team_id => 13, :competition_id => 21)
Fixture.find_or_create_by_id(:id => 204, :kickoff => DateTime.parse('2014-01-11 15:00:00'), :home_team_id => 7,  :away_team_id => 16, :competition_id => 21)
Fixture.find_or_create_by_id(:id => 205, :kickoff => DateTime.parse('2014-01-11 15:00:00'), :home_team_id => 8,  :away_team_id => 4,  :competition_id => 21)
Fixture.find_or_create_by_id(:id => 206, :kickoff => DateTime.parse('2014-01-11 15:00:00'), :home_team_id => 11, :away_team_id => 17, :competition_id => 21)
Fixture.find_or_create_by_id(:id => 207, :kickoff => DateTime.parse('2014-01-11 15:00:00'), :home_team_id => 12, :away_team_id => 10, :competition_id => 21)
Fixture.find_or_create_by_id(:id => 208, :kickoff => DateTime.parse('2014-01-11 15:00:00'), :home_team_id => 14, :away_team_id => 19, :competition_id => 21)
Fixture.find_or_create_by_id(:id => 209, :kickoff => DateTime.parse('2014-01-11 15:00:00'), :home_team_id => 15, :away_team_id => 9,  :competition_id => 21)
Fixture.find_or_create_by_id(:id => 210, :kickoff => DateTime.parse('2014-01-11 15:00:00'), :home_team_id => 18, :away_team_id => 5,  :competition_id => 21)

Fixture.find_or_create_by_id(:id => 211, :kickoff => DateTime.parse('2014-01-18 15:00:00'), :home_team_id => 1,  :away_team_id => 7,  :competition_id => 22)
Fixture.find_or_create_by_id(:id => 212, :kickoff => DateTime.parse('2014-01-18 15:00:00'), :home_team_id => 4,  :away_team_id => 11, :competition_id => 22)
Fixture.find_or_create_by_id(:id => 213, :kickoff => DateTime.parse('2014-01-18 15:00:00'), :home_team_id => 5,  :away_team_id => 15, :competition_id => 22)
Fixture.find_or_create_by_id(:id => 214, :kickoff => DateTime.parse('2014-01-18 15:00:00'), :home_team_id => 9,  :away_team_id => 2,  :competition_id => 22)
Fixture.find_or_create_by_id(:id => 215, :kickoff => DateTime.parse('2014-01-18 15:00:00'), :home_team_id => 11, :away_team_id => 3,  :competition_id => 22)
Fixture.find_or_create_by_id(:id => 216, :kickoff => DateTime.parse('2014-01-18 15:00:00'), :home_team_id => 13, :away_team_id => 8,  :competition_id => 22)
Fixture.find_or_create_by_id(:id => 217, :kickoff => DateTime.parse('2014-01-18 15:00:00'), :home_team_id => 16, :away_team_id => 14, :competition_id => 22)
Fixture.find_or_create_by_id(:id => 218, :kickoff => DateTime.parse('2014-01-18 15:00:00'), :home_team_id => 17, :away_team_id => 18, :competition_id => 22)
Fixture.find_or_create_by_id(:id => 219, :kickoff => DateTime.parse('2014-01-18 15:00:00'), :home_team_id => 19, :away_team_id => 6,  :competition_id => 22)
Fixture.find_or_create_by_id(:id => 220, :kickoff => DateTime.parse('2014-01-18 15:00:00'), :home_team_id => 20, :away_team_id => 12, :competition_id => 22)

Fixture.find_or_create_by_id(:id => 221, :kickoff => DateTime.parse('2014-01-28 19:45:00'), :home_team_id => 2,  :away_team_id => 19, :competition_id => 23)
Fixture.find_or_create_by_id(:id => 222, :kickoff => DateTime.parse('2014-01-28 19:45:00'), :home_team_id => 11, :away_team_id => 3,  :competition_id => 23)
Fixture.find_or_create_by_id(:id => 223, :kickoff => DateTime.parse('2014-01-28 19:45:00'), :home_team_id => 13, :away_team_id => 12, :competition_id => 23)
Fixture.find_or_create_by_id(:id => 224, :kickoff => DateTime.parse('2014-01-28 19:45:00'), :home_team_id => 14, :away_team_id => 1,  :competition_id => 23)
Fixture.find_or_create_by_id(:id => 225, :kickoff => DateTime.parse('2014-01-28 19:45:00'), :home_team_id => 16, :away_team_id => 15, :competition_id => 23)
Fixture.find_or_create_by_id(:id => 226, :kickoff => DateTime.parse('2014-01-28 19:45:00'), :home_team_id => 17, :away_team_id => 7,  :competition_id => 23)
Fixture.find_or_create_by_id(:id => 227, :kickoff => DateTime.parse('2014-01-28 20:00:00'), :home_team_id => 5,  :away_team_id => 8,  :competition_id => 23)
Fixture.find_or_create_by_id(:id => 228, :kickoff => DateTime.parse('2014-01-28 20:00:00'), :home_team_id => 9,  :away_team_id => 6,  :competition_id => 23)
Fixture.find_or_create_by_id(:id => 229, :kickoff => DateTime.parse('2014-01-29 19:45:00'), :home_team_id => 4,  :away_team_id => 20, :competition_id => 23)
Fixture.find_or_create_by_id(:id => 230, :kickoff => DateTime.parse('2014-01-29 19:45:00'), :home_team_id => 18, :away_team_id => 10, :competition_id => 23)

Fixture.find_or_create_by_id(:id => 231, :kickoff => DateTime.parse('2014-02-01 15:00:00'), :home_team_id => 1,  :away_team_id => 5,  :competition_id => 24)
Fixture.find_or_create_by_id(:id => 232, :kickoff => DateTime.parse('2014-02-01 15:00:00'), :home_team_id => 3,  :away_team_id => 13, :competition_id => 24)
Fixture.find_or_create_by_id(:id => 233, :kickoff => DateTime.parse('2014-02-01 15:00:00'), :home_team_id => 6,  :away_team_id => 2,  :competition_id => 24)
Fixture.find_or_create_by_id(:id => 234, :kickoff => DateTime.parse('2014-02-01 15:00:00'), :home_team_id => 7,  :away_team_id => 14, :competition_id => 24)
Fixture.find_or_create_by_id(:id => 235, :kickoff => DateTime.parse('2014-02-01 15:00:00'), :home_team_id => 8,  :away_team_id => 18, :competition_id => 24)
Fixture.find_or_create_by_id(:id => 236, :kickoff => DateTime.parse('2014-02-01 15:00:00'), :home_team_id => 11, :away_team_id => 4,  :competition_id => 24)
Fixture.find_or_create_by_id(:id => 237, :kickoff => DateTime.parse('2014-02-01 15:00:00'), :home_team_id => 12, :away_team_id => 16, :competition_id => 24)
Fixture.find_or_create_by_id(:id => 238, :kickoff => DateTime.parse('2014-02-01 15:00:00'), :home_team_id => 15, :away_team_id => 11, :competition_id => 24)
Fixture.find_or_create_by_id(:id => 239, :kickoff => DateTime.parse('2014-02-01 15:00:00'), :home_team_id => 19, :away_team_id => 9,  :competition_id => 24)
Fixture.find_or_create_by_id(:id => 240, :kickoff => DateTime.parse('2014-02-01 15:00:00'), :home_team_id => 20, :away_team_id => 17, :competition_id => 24)

Fixture.find_or_create_by_id(:id => 241, :kickoff => DateTime.parse('2014-02-08 15:00:00'), :home_team_id => 2,  :away_team_id => 20, :competition_id => 25)
Fixture.find_or_create_by_id(:id => 242, :kickoff => DateTime.parse('2014-02-08 15:00:00'), :home_team_id => 4,  :away_team_id => 12, :competition_id => 25)
Fixture.find_or_create_by_id(:id => 243, :kickoff => DateTime.parse('2014-02-08 15:00:00'), :home_team_id => 5,  :away_team_id => 19, :competition_id => 25)
Fixture.find_or_create_by_id(:id => 244, :kickoff => DateTime.parse('2014-02-08 15:00:00'), :home_team_id => 9,  :away_team_id => 1,  :competition_id => 25)
Fixture.find_or_create_by_id(:id => 245, :kickoff => DateTime.parse('2014-02-08 15:00:00'), :home_team_id => 11, :away_team_id => 7,  :competition_id => 25)
Fixture.find_or_create_by_id(:id => 246, :kickoff => DateTime.parse('2014-02-08 15:00:00'), :home_team_id => 13, :away_team_id => 10, :competition_id => 25)
Fixture.find_or_create_by_id(:id => 247, :kickoff => DateTime.parse('2014-02-08 15:00:00'), :home_team_id => 14, :away_team_id => 15, :competition_id => 25)
Fixture.find_or_create_by_id(:id => 248, :kickoff => DateTime.parse('2014-02-08 15:00:00'), :home_team_id => 16, :away_team_id => 8,  :competition_id => 25)
Fixture.find_or_create_by_id(:id => 249, :kickoff => DateTime.parse('2014-02-08 15:00:00'), :home_team_id => 17, :away_team_id => 3,  :competition_id => 25)
Fixture.find_or_create_by_id(:id => 250, :kickoff => DateTime.parse('2014-02-08 15:00:00'), :home_team_id => 18, :away_team_id => 6,  :competition_id => 25)
