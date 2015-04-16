FaBet.delete_all

if TOGGLES_CONFIG['five_alive']
  FaBet.create(user_id: 1, player_id: 1)
  FaBet.create(user_id: 1, player_id: 2)

  FaBet.create(user_id: 2, player_id: 1)
  FaBet.create(user_id: 2, player_id: 2)
  FaBet.create(user_id: 2, player_id: 3)
  FaBet.create(user_id: 2, player_id: 4)
  FaBet.create(user_id: 2, player_id: 5)

  FaBet.create(user_id: 3, player_id: 2)
  FaBet.create(user_id: 3, player_id: 4)
  FaBet.create(user_id: 3, player_id: 6)
  FaBet.create(user_id: 3, player_id: 8)
  FaBet.create(user_id: 3, player_id: 10)
end
