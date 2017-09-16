module UsersHelper

  def valid_user
    @valid_user = User.find(session[:user_id])
  end

end
