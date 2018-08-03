class UsersController < ApplicationController
  
  def new 
    @user = User.new 
  end
  
  def create 
    @user = User.new 
    @user.name = params[:user][:name] 
    @user.password = params[:user][:password] 
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to root_path 
    else 
      render 'users/new' 
    end
  end 
  
end
