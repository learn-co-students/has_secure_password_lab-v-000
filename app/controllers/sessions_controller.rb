class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name]) #we find the user by matching the user input with the name.
    if @user.authenticate(params[:user][:password]) # once we find the user, we authenticate it with its password.
      session[:user_id] = @user.id # once authenticated, we assign the user to a session, that is login.
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end
end
