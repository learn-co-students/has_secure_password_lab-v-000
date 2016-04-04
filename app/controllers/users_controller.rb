class UsersController < ApplicationController

  def new
  end

  def create

    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to controller:'users', action:'new'
    elsif  @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to controller:'users', action:'welcome'
    else
      redirect_to controller:'users', action:'new'
    end
  end

  def welcome
    @user = User.find_by(id:session[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
