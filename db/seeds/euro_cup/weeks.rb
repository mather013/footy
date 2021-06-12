Week.delete_all

Week.create(id: 1, description: 'Group Stage 1', close_date: DateTime.parse('11-06-2021 19:00:00'))
Week.create(id: 2, description: 'Group Stage 2', close_date: DateTime.parse('16-06-2021 13:00:00'))
Week.create(id: 3, description: 'Group Stage 3', close_date: DateTime.parse('20-06-2021 16:00:00'))
Week.create(id: 4, description: 'Round of 16',   close_date: DateTime.parse('26-06-2021 16:00:00'))
Week.create(id: 5, description: 'Quarter-final', close_date: DateTime.parse('02-07-2021 16:00:00'))
Week.create(id: 6, description: 'Semi-final',    close_date: DateTime.parse('06-07-2021 19:00:00'))
Week.create(id: 7, description: 'Final',         close_date: DateTime.parse('11-07-2021 19:00:00'))
