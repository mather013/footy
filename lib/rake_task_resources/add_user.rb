module RakeTaskResources
  class AddUser
    class << self
      def perform args
        username = args[:username]
        password = args[:password]
        fullname = args[:name]
        user = User.new(:username => username, :password => password, :name => fullname)
        user.save
      end
    end
  end
end
