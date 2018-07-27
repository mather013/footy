Group.delete_all
GroupTeam.delete_all

Group.create(id: 1, name: 'Group A')
Group.create(id: 2, name: 'Group B')
Group.create(id: 3, name: 'Group C')
Group.create(id: 4, name: 'Group D')
Group.create(id: 5, name: 'Group E')
Group.create(id: 6, name: 'Group F')
Group.create(id: 7, name: 'Group G')
Group.create(id: 8, name: 'Group H')

# GROUP A
[24, 25, 9, 32].each do |team_id|
  GroupTeam.create(group_id: 1, team_id: team_id)
end

# GROUP B
[18, 14, 23, 28].each do |team_id|
  GroupTeam.create(group_id: 2, team_id: team_id)
end

# GROUP C
[11, 2, 21, 8].each do |team_id|
  GroupTeam.create(group_id: 3, team_id: team_id)
end

# GROUP D
[1, 13, 7, 19].each do |team_id|
  GroupTeam.create(group_id: 4, team_id: team_id)
end

# GROUP E
[4, 6, 27, 30].each do |team_id|
  GroupTeam.create(group_id: 5, team_id: team_id)
end

# GROUP F
[12, 17, 29, 16].each do |team_id|
  GroupTeam.create(group_id: 6, team_id: team_id)
end

# GROUP G
[3, 20, 31, 10].each do |team_id|
  GroupTeam.create(group_id: 7, team_id: team_id)
end

# GROUP H
[5, 15, 22, 26].each do |team_id|
  GroupTeam.create(group_id: 8, team_id: team_id)
end
