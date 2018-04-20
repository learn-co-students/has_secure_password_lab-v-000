class UsersController < ApplicationController
  def create
    redirect_to(controller: 'users', action: 'new') if params[:user][:password] != params[:user][:password_confirmation]
    @user = new_user
    @user.save
    session[:user_id] = @user.id
  end

  private

  def new_user
    User.new(name: params[:user][:name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
  end
end
