module RakeTaskResources
  class AddUser
    class << self
      def perform args
        username = args[:username]
        password = args[:password]
        full_name = args[:name]
        user = User.new(username: username, password: password, name: full_name)
        user.save
      end
    end
  end
end
