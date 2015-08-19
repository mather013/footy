Week.delete_all

Week.find_or_create_by_id(id: 1, description: 'Group Stage 1', close_date: DateTime.parse('10-06-2016 20:00:00'))
Week.find_or_create_by_id(id: 2, description: 'Group Stage 2', close_date: DateTime.parse('15-06-2016 14:00:00'))
Week.find_or_create_by_id(id: 3, description: 'Group Stage 3', close_date: DateTime.parse('19-06-2016 20:00:00'))
Week.find_or_create_by_id(id: 4, description: 'Round of 16',   close_date: DateTime.parse('25-06-2016 14:00:00'))
Week.find_or_create_by_id(id: 5, description: 'Quarter-final', close_date: DateTime.parse('30-06-2016 20:00:00'))
Week.find_or_create_by_id(id: 6, description: 'Semi-final',    close_date: DateTime.parse('06-07-2016 20:00:00'))
Week.find_or_create_by_id(id: 7, description: 'Final',         close_date: DateTime.parse('10-07-2016 20:00:00'))
