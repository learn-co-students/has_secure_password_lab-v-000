class UsersController < ApplicationController

  #signup page
  def new
    @user = User.new
  end

  #POST - create new user
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/homepage'
    else
      redirect_to '/users/new'
    end
  end

  #user homepage
  def homepage
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
