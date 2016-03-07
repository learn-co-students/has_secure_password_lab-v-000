class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    if user_params[:password] != user_params[:password_confirmation]
      redirect_to new_user_path
    else 
      @user = User.create(user_params)
      log_in_user
      redirect_to root_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
  
end
