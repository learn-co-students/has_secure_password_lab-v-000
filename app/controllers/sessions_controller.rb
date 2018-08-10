class SessionsController < ApplicationController

  def new
  end

  # logs you in with the correct password
  def create
    # user has entered login info
    # check the login info (name + password) against database
    user = User.find_by(:name => params[:user][:name])

    # if match, that is the user - create a session
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id

      redirect_to 'users/show'
    # if no match, redirect to login
    else
      redirect_to login_path
    end
  end
end
