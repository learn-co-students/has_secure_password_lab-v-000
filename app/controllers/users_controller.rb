class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if user_params[:password] == user_params[:password_confirmation]
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect to :welcome
    else
      redirect_to :new_user
    end 
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
