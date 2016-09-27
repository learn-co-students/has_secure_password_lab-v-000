require "pry"
class SessionsController < ApplicationController

  def new
    
  end
  
  def create
    if params[:user][:name] == nil || params[:user][:name].empty?
      redirect_to "new"
    else
      @user = User.find_by(name: params[:user][:name])
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to "/users/homepage"
    end
  end
end