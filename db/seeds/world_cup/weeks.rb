Week.delete_all

Week.find_or_create_by_id(:id => 1,
 :week => '201401',
 :description => 'World Cup 2014 group stage 1',
 :close_date => DateTime.parse('12-06-2014 12:00:00'))

Week.find_or_create_by_id(:id => 2,
 :week => '201402',
 :description => 'World Cup 2014 group stage 2',
 :close_date => DateTime.parse('17-06-2014 12:00:00'))

Week.find_or_create_by_id(:id => 3,
 :week => '201403',
 :description => 'World Cup 2014 group stage 3',
 :close_date => DateTime.parse('23-06-2014 12:00:00'))
 
Week.find_or_create_by_id(:id => 4,
 :week => '201404',
 :description => 'World Cup 2014 last 16',
 :close_date => DateTime.parse('28-06-2014 12:00:00'))
 
 Week.find_or_create_by_id(:id => 5,
 :week => '201405',
 :description => 'World Cup 2014 quarter final',
 :close_date => DateTime.parse('04-07-2014 12:00:00'))
 
 Week.find_or_create_by_id(:id => 6,
 :week => '201406',
 :description => 'World Cup 2014 semi final',
 :close_date => DateTime.parse('08-07-2014 12:00:00'))
 
 Week.find_or_create_by_id(:id => 7,
 :week => '201407',
 :description => 'World Cup 2014 final',
 :close_date => DateTime.parse('12-07-2014 12:00:00'))
