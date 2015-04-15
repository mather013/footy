Week.delete_all

Week.find_or_create_by_id(id: 1, description: 'Group Stage 1', close_date: DateTime.parse('01-04-2015 00:30:00'))
Week.find_or_create_by_id(id: 2, description: 'Group Stage 2', close_date: DateTime.parse('15-06-2015 22:00:00'))
Week.find_or_create_by_id(id: 3, description: 'Group Stage 3', close_date: DateTime.parse('19-06-2015 22:00:00'))
Week.find_or_create_by_id(id: 4, description: 'Quarter-final', close_date: DateTime.parse('25-06-2015 00:30:00'))
Week.find_or_create_by_id(id: 5, description: 'Semi-final',    close_date: DateTime.parse('29-06-2015 00:30:00'))
Week.find_or_create_by_id(id: 6, description: 'Final',         close_date: DateTime.parse('04-07-2015 00:30:00'))
