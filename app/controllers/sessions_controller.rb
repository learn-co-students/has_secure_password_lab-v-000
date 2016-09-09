class SessionsController < ApplicationController

def new
  @user = User.new
end 

def create

  @user = User.find(username: params[:username])
  user = user.try(:authenticate, params[:user][:password])
  redirect_to(controller: 'sessions', action: 'new') unless user

  session[:user_id] = @user.id
  @user = user
  redirect_to controller: 'welcome', action: 'home'

end 

end



