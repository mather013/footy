Week.delete_all

Week.find_or_create_by_id(id: 1,  description: 'Premier League R01', close_date: DateTime.parse('16-06-2014 12:45:00'), complete: true)
Week.find_or_create_by_id(id: 2,  description: 'Premier League R02', close_date: DateTime.parse('23-06-2014 12:45:00'), complete: true)
Week.find_or_create_by_id(id: 3,  description: 'Premier League R03', close_date: DateTime.parse('30-06-2014 12:45:00'), complete: true)
Week.find_or_create_by_id(id: 4,  description: 'Premier League R04', close_date: DateTime.parse('13-07-2014 19:45:00'), complete: true)
Week.find_or_create_by_id(id: 5,  description: 'Premier League R05', close_date: DateTime.parse('20-07-2014 12:45:00'))
Week.find_or_create_by_id(id: 6,  description: 'Premier League R06', close_date: DateTime.parse('27-07-2014 12:45:00'))
