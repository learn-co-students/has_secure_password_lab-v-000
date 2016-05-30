class SessionsController < ApplicationController

  def new

  end

  
   
  def create
  
    @user = User.find_by(name: params[:user][:name])
    binding.pry
    if @user.authenticate(params[:user][:password])
     
      session[:user_id] = @user.id
    else
      redirect_to 'users/new'
  end
  end


  

  def show

  end

  def destroy
    binding.pry
    session.clear if session[:name] != nil
    redirect_to '/'

  end




end