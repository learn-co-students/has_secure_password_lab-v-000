class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user = user.try(:authenticate, params[:user][:password])
      session[:user_id] = user.id
      @user = user
      flash[:success] = "You have sucessfully logged in!"
      redirect_to controller: 'welcome', action: 'home'
    else
      flash[:warning] = "Please try again."
      redirect_to controller: 'sessions', action: 'new'
    end
  end

  def destroy
    session[:user_id].destroy
    flash[:success] = "You have sucessfully logged out!"
    redirect_to '/login'
  end

end
