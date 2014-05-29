Week.delete_all

Week.find_or_create_by_id(:id => 1,
 :description => 'Group Stage 1',
 :close_date => DateTime.parse('12-06-2014 20:00:00'))

Week.find_or_create_by_id(:id => 2,
 :description => 'Group Stage 2',
 :close_date => DateTime.parse('17-06-2014 19:00:00'))

Week.find_or_create_by_id(:id => 3,
 :description => 'Group Stage 3',
 :close_date => DateTime.parse('23-06-2014 20:00:00'))
 
Week.find_or_create_by_id(:id => 4,
 :description => 'Round of 16',
 :close_date => DateTime.parse('28-06-2014 16:00:00'))
 
 Week.find_or_create_by_id(:id => 5,
 :description => 'Quarter-final',
 :close_date => DateTime.parse('04-07-2014 16:00:00'))
 
 Week.find_or_create_by_id(:id => 6,
 :description => 'Semi-final',
 :close_date => DateTime.parse('08-07-2014 20:00:00'))
 
 Week.find_or_create_by_id(:id => 7,
 :description => 'Final',
 :close_date => DateTime.parse('12-07-2014 20:00:00'))
