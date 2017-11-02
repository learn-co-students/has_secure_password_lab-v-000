class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    #THIS is to create a new session for the user
    user = User.find_by(name: params[:user][:name])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
    else
      redirect_to '/login', alert: "password was incorrect"
    end
  end
end
