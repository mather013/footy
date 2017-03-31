Bets::FaBet.delete_all

if TOGGLES_CONFIG['five_alive']
  Bets::FaBet.create(user_id: 1, player_id: 1)
  Bets::FaBet.create(user_id: 1, player_id: 2)

  Bets::FaBet.create(user_id: 2, player_id: 1)
  Bets::FaBet.create(user_id: 2, player_id: 2)
  Bets::FaBet.create(user_id: 2, player_id: 3)
  Bets::FaBet.create(user_id: 2, player_id: 4)
  Bets::FaBet.create(user_id: 2, player_id: 5)

  Bets::FaBet.create(user_id: 3, player_id: 2)
  Bets::FaBet.create(user_id: 3, player_id: 4)
  Bets::FaBet.create(user_id: 3, player_id: 6)
  Bets::FaBet.create(user_id: 3, player_id: 8)
  Bets::FaBet.create(user_id: 3, player_id: 10)
end
