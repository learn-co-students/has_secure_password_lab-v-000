require 'pry'
class SessionsController < ApplicationController
  def new
    @user = User.find_by(name: params[:name])
  end

  def create 
    @user = User.find_by(name: params[:user][:name])
   # binding.pry
    if @user
    return redirect_to '/users/new' unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id 
    end
    redirect_to '/'
  end 

end
