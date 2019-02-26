class UsersController < ApplicationController

  def new
  end

  def create
    #binding.pry

    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to new_user_path
    else
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to users_path
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
