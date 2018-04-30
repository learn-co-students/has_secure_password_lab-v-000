class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to new_user_path
    else
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def find_user 
    @user = User.find_by(params[:id])
  end

end