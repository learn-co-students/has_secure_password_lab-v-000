class SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    if user
      session[:user_id] = user.id
      @user = user
      redirect_to controller: 'users', action: 'home'
    else
      redirect_to controller: 'sessions', action: 'new'
    end
  end

end
