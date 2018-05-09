class SessionsController < ApplicationController

def create
   @user = User.find_by(name: params[:user][:name])
   @user = @user.try(:authenticate, params[:user][:password])
   return redirect_to controller: 'sessions', action: 'new' unless @user
   session[:user_id] = @user.id
   redirect_to controller: 'welcome', action: 'index'
    #if @user.authenticate(params[:password])
  #   session[:user_id] = @user.id
  #  # redirect_to controller: 'welcome', action: 'index'
  # else
  #   redirect_to controller: 'sessions', action: 'new'

 end

  def new
  end
end
