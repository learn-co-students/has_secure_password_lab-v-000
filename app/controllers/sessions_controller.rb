class SessionsController < ApplicationController
  def new
    #render login form
    @user = User.new
  end

  def create
    #authenticate and login
    @user = User.find_by(name: params[:user][:name])
    #binding.pry
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to root_path
  end


  def destroy
    #delete session
    session.delete :user_id
    redirect_to root_path
  end

  def greeting
  end

end
