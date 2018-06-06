class UsersController < ApplicationController

  def create
    if params[:user][:password] && params[:user][:password] != params[:user][:password_confirmation]
      redirect_to '/users/new'
    else
      @user = User.create(name: params[:user][:name], password: params[:user][:password])
      session[:user_id] = @user.id
    redirect_to '/welcome'
    end
  end

  def welcome
  end

end