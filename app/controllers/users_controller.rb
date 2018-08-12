class UsersController < ApplicationController

  def new
    render '/users/new'
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/home'
    else
      redirect_to '/users/new'
    end
  end

  def home
    @current_user = User.find_by(id: session[:user_id]).name
    render '/users/home'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
