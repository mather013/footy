LmRound.delete_all

if TOGGLES_CONFIG['last_man_standing']
  LmRound.find_or_create_by_id(id: 1, week_id: 1)
  LmRound.find_or_create_by_id(id: 2, week_id: 2)
  LmRound.find_or_create_by_id(id: 3, week_id: 3)
  LmRound.find_or_create_by_id(id: 4, week_id: 4)
end
