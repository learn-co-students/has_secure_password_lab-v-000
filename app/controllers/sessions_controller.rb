require 'pry'
class SessionsController < ApplicationController
  def destroy 
  end 

  def create
    user = User.find_by(name: user_params[:name])
    if user.authenticate(user_params[:password])
      session[:user_id] = user.id 
      redirect_to root_path 
    else 
      render :new 
    end 
  end 

  private 

  def user_params 
    params.require(:user).permit(:name, :password)
  end 
    
end 
