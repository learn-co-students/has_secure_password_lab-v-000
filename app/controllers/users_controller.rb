class UsersController < ApplicationController
  def new
  end

  def create
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to new_user_path
    else
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to root_path    
    end
  end

  def welcome
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end


