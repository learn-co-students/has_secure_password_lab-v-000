require 'pry'

class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to welcome_path
    else  
      redirect_to new_session_path
    end  
  end

  def destroy
    session.clear if session[:user_id]
  end  
end  