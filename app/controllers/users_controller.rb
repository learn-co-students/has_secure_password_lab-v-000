class UsersController < ApplicationController

  def index
    @user = User.find_by_id(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:user][:password] == params[:user][:password_confirmation]
      @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash.notice = "Passwords must match"
      redirect_to new_user_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
