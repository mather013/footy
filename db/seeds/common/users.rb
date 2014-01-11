User.delete_all

User.find_or_create_by_username(:username => 'markm',  :password => 'bodie')
User.find_or_create_by_username(:username => 'davidb', :password => 'apple12')
User.find_or_create_by_username(:username => 'andyb',  :password => 'paper47')
User.find_or_create_by_username(:username => 'adams',  :password => 'cloud91')
User.find_or_create_by_username(:username => 'samc',   :password => 'bread33')
User.find_or_create_by_username(:username => 'samt',   :password => 'phone51')