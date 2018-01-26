module SessionsHelper
  def log_in(user) # logs in the given user by storing primary key id attribute of user instance in session hash
    session[:user_id] = user.id
  end
  # Returns the currently logged-in user (if one exists) or nil (if no user is currently logged in)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
