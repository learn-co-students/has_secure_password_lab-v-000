class SessionsController < ApplicationController
  def new
    #render login form
  end

  def create
    #authenticate and login
    @user = User.find_by(name: params[:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end


  def destroy
    #delete session
  end

  def greeting
  end

end
