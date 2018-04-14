class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    redirect_to '/users/new' unless @user.save
    session[:user.id] = @user.id
    redirect_to '/users/welcome' 
  end
end
