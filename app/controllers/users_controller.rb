class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      session[:user_id] = @user.id
      render :welcome
    else
      redirect_to new_user_url
    end
  end

  def welcome
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
