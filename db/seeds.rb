User.delete_all

User.find_or_create_by_username(:id => 1, :username => 'markm', :password => 'bodie')
User.find_or_create_by_username(:id => 2, :username => 'davidb', :password => 'apple12')