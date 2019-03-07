class UsersController < ApplicationController
  def welcome
    redirect_to login_path if !session[:user_id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      login(@user)
      redirect_to '/'
    else
      redirect_to new_user_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def login(user)
      session[:user_id] = user.id
    end
end
