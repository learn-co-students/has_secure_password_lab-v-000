require 'pry'
class SessionsController < ApplicationController

  def new
      # nothing to do here!
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    #binding.pry
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
  end

  def destroy
    session.clear
  end

end
