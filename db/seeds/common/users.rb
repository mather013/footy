User.delete_all

User.find_or_create_by_username(:id => 1, :username => 'markm',  :password => 'bodie')
User.find_or_create_by_username(:id => 2, :username => 'davidb', :password => 'apple12')
User.find_or_create_by_username(:id => 3, :username => 'andyb',  :password => 'paper47')
User.find_or_create_by_username(:id => 4, :username => 'adams',  :password => 'cloud91')
User.find_or_create_by_username(:id => 5, :username => 'samc',   :password => 'bread33')
User.find_or_create_by_username(:id => 6, :username => 'samt',   :password => 'phone51')