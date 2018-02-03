class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      #raise @user.inspect
      session[:user_id] = @user.id
      #raise session[:user_id].inspect
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  def welcome
    #raise session[:user_id].inspect
    @user = User.find(session[:user_id])
    render 'layouts/welcome'
  end

private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
