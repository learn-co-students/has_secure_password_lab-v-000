class UsersController < ApplicationController
  def show
  
  end

  def create
    @user = User.new(name: params[:user][:name], password: params[:user][:password])
    if params[:user][:password] == params[:user][:password_confirmation] && @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/users/new'
    end
  end
end
