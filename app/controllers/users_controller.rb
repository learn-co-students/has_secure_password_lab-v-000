class UsersController < ApplicationController
  def new
  end

  def home
  end

  def create
    @user = User.create(user_params)
    if !@user.save
      redirect_to controller: 'users', action: 'new'
    else
      session[:user_id] = @user.id
      redirect_to controller: 'application', action: 'home'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
