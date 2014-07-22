Week.delete_all

Week.find_or_create_by_id(id: 1,  description: 'Week 01', close_date: DateTime.parse('16-06-2014 11:45:00'), complete: true)
Week.find_or_create_by_id(id: 2,  description: 'Week 02', close_date: DateTime.parse('23-06-2014 11:45:00'), complete: true)
Week.find_or_create_by_id(id: 3,  description: 'Week 03', close_date: DateTime.parse('30-06-2014 11:45:00'), complete: true)
Week.find_or_create_by_id(id: 4,  description: 'Week 04', close_date: DateTime.parse('13-07-2014 18:45:00'), complete: true)
Week.find_or_create_by_id(id: 5,  description: 'Week 05', close_date: DateTime.parse('24-07-2014 11:45:00'))
Week.find_or_create_by_id(id: 6,  description: 'Week 06', close_date: DateTime.parse('27-07-2014 11:45:00'))
