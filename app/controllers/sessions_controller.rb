class SessionsController < ApplicationController
  def new
  end

  def create
    # Find a user
    user = User.find_by(name: params[:user][:name]) 
    # Authenticate, if true set instance variable
    @user = user.try(:authenticate, params[:user][:password]) 
    # If @user is not valid, redirect to the login page
    return redirect_to(controller: 'sessions', action: 'new') unless @user 
    # Set the user_id key of the session hash to @user's id
    session[:user_id] = @user.id 
    redirect_to controller: 'welcome', action: 'home' 
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end
