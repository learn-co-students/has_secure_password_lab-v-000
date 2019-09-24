class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if password_confirmed?
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to controller: 'welcome', action: 'hello'
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def password_confirmed?
    params[:user][:password] == params[:user][:password_confirmation]
  end
end
