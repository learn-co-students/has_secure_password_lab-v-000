class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      #log them in and welcome user
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      render :new
    end
  end

  def welcome
    if logged_in?
      render :welcome
    else
      redirect_to login_path
    end
  end

  private

  def user_params
    params.requre(:user).permit(:name, :password, :password_confirmation)
  end

end
