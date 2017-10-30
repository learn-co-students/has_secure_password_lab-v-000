class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create

    if params[:user][:password] == params[:user][:password_confirmation]
      new_user = User.create(user_params)
      session[:user_id] = new_user.id
      redirect_to '/'
    else
      redirect_to '/users/new', alert: "Passwords do not match"
    end
  end

  def home
    @user = User.find_by(id: session[:user_id])
    redirect_to new_user_path if @user.nil?
  end

  private

  def user_params
    params.require(:user).permit(:password, :name)
  end

end
