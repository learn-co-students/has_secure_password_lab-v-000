class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new # implicitly renders login form - app/views/sessions/new.html.erb
  end

  def create
    user = User.find_by(name: params[:user][:name])
    # user is either user instance w/ submitted name or nil if no such user exists w/ that name
    authenticated = user.try(:authenticate, params[:user][:password])

    if authenticated # authenticated = user instance (truthy value) b/c user authenticated with submitted password
      session[:user_id] = user.id # log in the user
      flash[:message] = "You have successfully logged in!"
      redirect_to controller: 'welcome', action: 'greet_user'
    else # authenticated = false b/c user did NOT authenticate with the submitted password or user = nil bc user didn't exist w/ name to begin with
      flash[:message] = "Your attempt at logging in was unsuccessful. Please enter a valid username and password combination."
      redirect_to login_path # same as redirect_to controller: 'sessions', action: 'new'
    end
  end

  def destroy # log out the user
    session.delete(:user_id)
    flash[:message] = "Goodbye for now!"
    redirect_to '/'
  end
end
