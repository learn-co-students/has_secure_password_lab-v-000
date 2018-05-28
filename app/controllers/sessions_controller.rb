class SessionsController < ApplicationController
  def create
    # We find a user the has the given username and password
    # We make the session[:user_id] match the user.id if the user exists
    # Route to the homepage route because they logged hin
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to homepage_path
    else
      # route user to the new user route if they don't exist
      redirect_to new_user_path
    end
  end
end
