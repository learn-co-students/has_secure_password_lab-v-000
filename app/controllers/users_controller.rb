class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.create(user_params)
      if @user
        session[:user_id] = @user.id
        redirect_to users_path(@user)
      end
    else
      redirect_to signup_path
    end
  end

  def show
    if logged_in?
      @user = User.find_by(id: params[:id])
    else
      redirect_to login_path
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end


end
