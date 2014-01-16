Week.delete_all

Week.find_or_create_by_id(:id => 1,
 :week => '201401',
 :description => 'World Cup 2014 12th Jun',
 :close_date => DateTime.parse('12-06-2014 12:00:00'))

Week.find_or_create_by_id(:id => 2,
 :week => '201402',
 :description => 'World Cup 2014 17th Jun',
 :close_date => DateTime.parse('17-06-2014 12:00:00'))

Week.find_or_create_by_id(:id => 3,
 :week => '201403',
 :description => 'World Cup 2014 23rd Jun',
 :close_date => DateTime.parse('23-06-2014 12:00:00'))
 
