class UsersController < ApplicationController
  def homepage
  end

  def new
  end

  def create
    if passwords_match?
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def passwords_match?
    params[:user][:password] == params[:user][:password_confirmation]
  end
end
