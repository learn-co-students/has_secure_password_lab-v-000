class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)

    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to '/homepage'
    else
      redirect_to '/users/new'
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
