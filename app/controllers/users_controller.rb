class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.password != user.password_confirmation
      redirect_to '/users/new'
    else
      user.save
      session[:user_id] = user.id
      redirect_to '/home'
    end
  end

  def home
  end

private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :name)
  end

end
