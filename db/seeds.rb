User.delete_all

User.find_or_create_by_username(:id => 1, :username => 'markm', :password => 'bodie')
User.find_or_create_by_username(:id => 2, :username => 'davidb', :password => 'apple12')

Competition.find_or_create_by_id(:id => 1,
                                 :week => '201301',
                                 :description => 'Premier League W/E 24th Aug',
                                 :close_date => DateTime.parse('24-08-2013'))

Competition.find_or_create_by_id(:id => 2,
                                 :week => '201302',
                                 :description => 'Premier League W/E 31st Aug',
                                 :close_date => DateTime.parse('31-08-2013'))
