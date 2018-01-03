Week.delete_all

Week.create(id: 1, description: 'Group Stage 1', close_date: DateTime.parse('14-06-2018 15:00:00'))
Week.create(id: 2, description: 'Group Stage 2', close_date: DateTime.parse('19-06-2018 18:00:00'))
Week.create(id: 3, description: 'Group Stage 3', close_date: DateTime.parse('25-06-2018 14:00:00'))
Week.create(id: 4, description: 'Round of 16',   close_date: DateTime.parse('30-06-2018 14:00:00'))
Week.create(id: 5, description: 'Quarter-final', close_date: DateTime.parse('06-07-2018 14:00:00'))
Week.create(id: 6, description: 'Semi-final',    close_date: DateTime.parse('10-07-2018 19:00:00'))
Week.create(id: 7, description: 'Final',         close_date: DateTime.parse('14-07-2018 14:00:00'))
