Week.delete_all

Week.create(id: 1, description: 'Group Stage 1', close_date: DateTime.parse('17-06-2017 15:00:00'))
Week.create(id: 2, description: 'Group Stage 2', close_date: DateTime.parse('21-06-2017 15:00:00'))
Week.create(id: 3, description: 'Group Stage 3', close_date: DateTime.parse('24-06-2017 15:00:00'))
Week.create(id: 4, description: 'Semi-final',    close_date: DateTime.parse('28-06-2017 18:00:00'))
Week.create(id: 5, description: 'Final',         close_date: DateTime.parse('02-07-2017 12:00:00'))
