class SessionsController < ApplicationController

  def new
  end

  def create
    if @user = User.find_by(name: params[:user][:name])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
      end
      redirect_to '/'
    else
      redirect_to(controller: 'sessions', action: 'new') 
    end 
  end

end