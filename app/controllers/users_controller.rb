class UsersController < ApplicationController

  def home
  end

  def new
  end

  def create
    if params[:user][:password] != params[:user][:password_confirmation]
      flash[:alert] = "Password did not match"  
      redirect_to new_user_path
    else
      @user = User.new(user_params)
      @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    end
  end

    private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end

