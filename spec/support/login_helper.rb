module LoginHelper
  def log_in_as user_name
    user = User.find_or_initialize_by(username: user_name)
    user.update_attributes(name: user_name, password: 'abc')
    cookies.permanent[:user_id] = user.id
  end
end

include LoginHelper