Group.delete_all
GroupTeam.delete_all

Group.create(id: 1, name: 'Group A')
Group.create(id: 2, name: 'Group B')
Group.create(id: 3, name: 'Group C')
Group.create(id: 4, name: 'Group D')
Group.create(id: 5, name: 'Group E')
Group.create(id: 6, name: 'Group F')

# GROUP A
[11, 21, 22, 24].each do |team_id|
  GroupTeam.create(group_id: 1, team_id: team_id)
end

# GROUP B
[2, 5, 7 16].each do |team_id|
  GroupTeam.create(group_id: 2, team_id: team_id)
end

# GROUP C
[1, 12, 13, 23].each do |team_id|
  GroupTeam.create(group_id: 3, team_id: team_id)
end

# GROUP D
[3, 4, 6, 17].each do |team_id|
  GroupTeam.create(group_id: 4, team_id: team_id)
end

# GROUP E
[14, 18, 19, 20].each do |team_id|
  GroupTeam.create(group_id: 5, team_id: team_id)
end

# GROUP F
[8, 9, 10, 15].each do |team_id|
  GroupTeam.create(group_id: 6, team_id: team_id)
end
