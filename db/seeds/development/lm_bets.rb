LmBet.delete_all

if TOGGLES_CONFIG['last_man_standing']
  LmBet.create(lm_round_id: 1, user_id: 1, team_id: 12) #NEW win
  LmBet.create(lm_round_id: 2, user_id: 1, team_id: 9)  #LIV win
  LmBet.create(lm_round_id: 3, user_id: 1, team_id: 2)  #AST win
  LmBet.create(lm_round_id: 4, user_id: 1, team_id: 10) #MCI

  LmBet.create(lm_round_id: 1, user_id: 2, team_id: 8)  #LEI win
  LmBet.create(lm_round_id: 2, user_id: 2, team_id: 12) #NEW win
  LmBet.create(lm_round_id: 3, user_id: 2, team_id: 1)  #ARS loss

  LmBet.create(lm_round_id: 1, user_id: 3, team_id: 1)  #ARS win
  LmBet.create(lm_round_id: 2, user_id: 3, team_id: 9)  #LIV win
  LmBet.create(lm_round_id: 3, user_id: 3, team_id: 4)  #CHE win
  LmBet.create(lm_round_id: 4, user_id: 3, team_id: 10) #MCI
end
