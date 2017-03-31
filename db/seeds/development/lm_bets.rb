Bets::LmsBet.delete_all

if TOGGLES_CONFIG['last_man_standing']
  Bets::LmsBet.create(lm_round_id: 1, user_id: 1, team_id: 12) #NEW win
  Bets::LmsBet.create(lm_round_id: 2, user_id: 1, team_id: 9)  #LIV win
  Bets::LmsBet.create(lm_round_id: 3, user_id: 1, team_id: 2)  #AST win
  Bets::LmsBet.create(lm_round_id: 4, user_id: 1, team_id: 10) #MCI

  Bets::LmsBet.create(lm_round_id: 1, user_id: 2, team_id: 8)  #LEI win
  Bets::LmsBet.create(lm_round_id: 2, user_id: 2, team_id: 12) #NEW win
  Bets::LmsBet.create(lm_round_id: 3, user_id: 2, team_id: 1)  #ARS loss

  Bets::LmsBet.create(lm_round_id: 1, user_id: 3, team_id: 1)  #ARS win
  Bets::LmsBet.create(lm_round_id: 2, user_id: 3, team_id: 9)  #LIV win
  Bets::LmsBet.create(lm_round_id: 3, user_id: 3, team_id: 4)  #CHE win
  Bets::LmsBet.create(lm_round_id: 4, user_id: 3, team_id: 10) #MCI
end
