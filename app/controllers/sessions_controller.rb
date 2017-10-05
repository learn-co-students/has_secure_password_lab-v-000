require 'pry'
class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/users/home'
    else
      redirect_to '/'
    end
  end
end
