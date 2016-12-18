class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    if @user.authenticate(params[:user][:password])
      redirect_to '/'
    else
      redirect_to new_user_path
    end
  end

  def destroy
  end

  def home
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_comfirmation)
  end

end
