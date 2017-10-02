class SessionsController < ApplicationController
  def login
    binding.pry
    session[:user_id] = @user.id
    
  end

  def signup

  end
  def create
    
    @user = User.find_by_name(params[:user][:name])
    
return head(:forbidden) unless
    @user.authenticate(params[:user][:password])

    session[:user_id] = @user.id

    # binding.pry
  end

  def destroy
    session.delete :user
  end

  
  end
