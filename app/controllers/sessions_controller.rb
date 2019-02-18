class SessionsController < ApplicationController
  def new
  end

  def create
    #user is trying to log in

    @user = User.find_by(name: params[:user][:name])

    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to controller: 'users',  action: 'welcome'
    else
      redirect_to 'new'
    end
  end
end
