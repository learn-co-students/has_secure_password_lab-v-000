class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.find_by(name: params[:user][:name])
      user = user.try(:authenticate, params[:user][:password])
      return redirect_to(controller: 'sessions', action: 'new') unless user
      session[:user_id] = user.id
      @user = user
      redirect_to controller: 'welcome', action: 'home'
    else
      redirect_to new_user_path
    end
  end

  def destroy
    session.destroy
    redirect_to controller: 'sessions', action: 'new'
  end
end
