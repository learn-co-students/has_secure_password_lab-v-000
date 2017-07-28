class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:user][:name])
    # If user exists / password correct.
    if user && user.authenticate(params[:user][:password])
      # Save user id
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      binding.pry
    # User's login doesn't work = send to login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
